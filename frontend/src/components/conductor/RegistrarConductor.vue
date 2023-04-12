<template>
  <div class="col-lg-8 offset-lg-2">
    <div class="card">
      <div class="card-body">
        <h4>Registrar nuevo conductor</h4>
        <form @submit.prevent="guardarConductor">
          <div class="mb-3 text-start">
            <label class="form-label required">Identificación</label>
            <input
              v-model="conductor.identificacion"
              class="form-control"
              type="number"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Nombre</label>
            <input
              v-model="conductor.nombre"
              class="form-control"
              type="text"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Apellido</label>
            <input
              v-model="conductor.apellido"
              class="form-control"
              type="text"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Teléfono</label>
            <input
              v-model="conductor.telefono"
              class="form-control"
              type="number"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label class="form-label required">Dirección</label>
            <input
              v-model="conductor.direccion"
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
      conductor: {},
    };
  },
  mounted() {},
  methods: {
    async guardarConductor() {
      Swal.fire({
        title: "Guardando conductor",
        text: "Espere un poco por favor.",
        showConfirmButton: false,
        allowEscapeKey: false,
        allowOutsideClick: false,
      });
      await axios
        .post("http://127.0.0.1:8000/api/conductores", this.conductor)
        .then((response) => {
          console.log(response);
          Swal.close();
          Swal.fire({
            title: "Éxito",
            html: "Conductor creado exitosamente",
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
