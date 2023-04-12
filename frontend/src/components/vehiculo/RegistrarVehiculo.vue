<template>
  <div class="col-lg-8 offset-lg-2">
    <div class="card">
      <div class="card-body">
        <h4>Registrar nuevo vehículo</h4>
        <form @submit.prevent="guardarVehiculo">
          <div class="mb-3 text-start">
            <label class="form-label required">Placa</label>
            <input
              v-model="vehiculo.placa"
              class="form-control"
              type="text"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Modelo</label>
            <input
              v-model="vehiculo.modelo"
              class="form-control"
              type="number"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Capacidad</label>
            <input
              v-model="vehiculo.capacidad"
              class="form-control"
              type="text"
              required
            />
          </div>
          <div class="mb-3 center">
            <button type="submit" class="btn btn-success">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import Swal from "sweetalert2/dist/sweetalert2";
export default {
  data() {
    return {
      vehiculo: {},
    };
  },
  mounted() {},
  methods: {
    async guardarVehiculo() {
      Swal.fire({
        title: "Guardando vehículo",
        text: "Espere un poco por favor.",
        showConfirmButton: false,
        allowEscapeKey: false,
        allowOutsideClick: false,
      });
      await axios
        .post("http://127.0.0.1:8000/api/vehiculos", this.vehiculo)
        .then((response) => {
          console.log(response);
          Swal.close();
          Swal.fire({
            title: "Éxito",
            html: "Vehículo creado exitosamente",
            icon: "success",
            showConfirmButton: false,
            allowEscapeKey: false,
            allowOutsideClick: false,
            timer: 2500,
          });
          setTimeout(() => {
            window.location.href = "/";
          }, 500);
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
