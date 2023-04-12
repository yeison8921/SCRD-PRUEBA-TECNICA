<template>
  <div class="col-lg-8 offset-lg-2">
    <div class="card">
      <div class="card-body">
        <form @submit.prevent="asociarConductor">
          <div class="mb-3 text-start">
            <label for="">Elegir conductor</label>
            <Multiselect
              valueProp="id"
              label="full_name"
              v-model="conductor_id"
              :options="options_conductores"
              @input="getVehiculosNoAsignadosConductor()"
            />
          </div>
          <div class="mb-3 text-start">
            <label for="">Elegir vehiculo</label>
            <Multiselect
              valueProp="id"
              label="placa"
              v-model="vehiculo_id"
              :options="options_vehiculos"
            />
          </div>
          <div class="mb-3 center">
            <button type="submit" class="btn btn-success">Asociar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import Swal from "sweetalert2/dist/sweetalert2";
import Multiselect from "@vueform/multiselect";
export default {
  components: {
    Multiselect,
  },
  data() {
    return {
      conductor_id: null,
      vehiculo_id: "",
      options_conductores: [],
      options_vehiculos: [],
    };
  },
  mounted() {
    this.getConductores();
  },
  methods: {
    async getConductores() {
      await axios
        .get("http://127.0.0.1:8000/api/conductores")
        .then((response) => {
          this.options_conductores = response.data;
          Swal.close();
        });
    },
    getVehiculosNoAsignadosConductor() {
      this.vehiculo_id = "";
      setTimeout(() => {
        axios
          .post("http://127.0.0.1:8000/api/getVehiculosNoAsignadosConductor", {
            conductor_id: this.conductor_id,
          })
          .then((response) => {
            this.options_vehiculos = response.data;
          });
      }, 1000);
    },
    async asociarConductor() {
      Swal.fire({
        title: "Asociando conductor",
        text: "Espere un poco por favor.",
        showConfirmButton: false,
        allowEscapeKey: false,
        allowOutsideClick: false,
      });

      await axios
        .put("http://127.0.0.1:8000/api/vehiculos/" + this.vehiculo_id, {
          conductor_id: this.conductor_id,
        })
        .then((response) => {
          console.log(response);
          Swal.close();
          Swal.fire({
            title: "Éxito",
            html: "Conductor asociado exitosamente",
            icon: "success",
            showConfirmButton: false,
            allowEscapeKey: false,
            allowOutsideClick: false,
            timer: 2500,
          });
        });
    },
  },
};
</script>
<style>
.required:after {
  content: " *";
  color: red;
}
</style>
<style src="@vueform/multiselect/themes/default.css"></style>
