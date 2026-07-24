<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>😷</span>
          </div>
          <div class="card-title">
            <h3>Nuevo Paciente</h3>
            <p>Registrar nuevo paciente en el sistema</p>
          </div>
        </div>

        <div class="card-body">
          <form @submit.prevent="crearResponsable">
            <label>Código Ingreso</label>
            <input v-model="codigo" type="text" placeholder="Código ingreso" required />

            <label>Documento</label>
            <input v-model="documento" type="text" placeholder="Documento" required />

            <label>Nombre</label>
            <input v-model="nombre" type="text" placeholder="Nombre" required />

            <label>Apellido</label>
            <input v-model="apellido" type="text" placeholder="Apellido" required />

            <label>Dirección</label>
            <input v-model="direccion" type="text" placeholder="direccion" required />

            <label>Teléfono</label>
            <input v-model="telefono" type="text" placeholder="Teléfono" required />

            <button type="submit" class="save-btn">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      codigo: '',
      documento: '',
      nombre: '',
      apellido: '',
      cargo: '',
      telefono: ''
    }
  },
  methods: {
    crearResponsable() {
      const datos = {
        codigo: this.codigo,
        documento: this.documento,
        nombre: this.nombre,
        apellido: this.apellido,
        cargo: this.cargo,
        telefono: this.telefono
      }

      fetch('http://localhost/pacientes/responsables.php?insertar=1', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datos)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Responsable creado correctamente')
            this.codigo = ''
            this.documento = ''
            this.nombre = ''
            this.apellido = ''
            this.cargo = ''
            this.telefono = ''
          } else {
            alert(resp.message || 'Error al crear responsable')
          }
        })
        .catch(err => {
          console.error('Error al crear responsable:', err)
          alert('Error al crear responsable')
        })
    }
  }
}
</script>

<style scoped>
/* === CONTENEDOR GENERAL === */
.page-container {
  display: flex;
  justify-content: center;
  align-items: first baseline;
  min-height: 100vh;
  padding: 20px;
  background: none;
}

/* === TARJETA PRINCIPAL === */
.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 600px;
  width: 100%;
}

.card {
  background: rgba(255, 255, 255, 0.85);
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(198, 163, 79, 0.25);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 14px 40px rgba(0, 0, 0, 0.1);
}

/* === HEADER === */
.card-header {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
}
.card-icon {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  margin-right: 15px;
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: #fff;
  box-shadow: 0 4px 12px rgba(163, 130, 47, 0.15);
}
.card-title h3 {
  font-size: 18px;
  font-weight: 700;
  margin: 0 0 5px 0;
  color: #3b341b;
}
.card-title p {
  font-size: 13px;
  color: #8a6d2f;
  margin: 0;
  line-height: 1.3;
}

/* === CAMPOS DEL FORMULARIO === */
.card-body label {
  font-size: 14px;
  font-weight: 600;
  color: #4b3d09;
  margin-top: 12px;
  margin-bottom: 6px;
  display: block;
}
.card-body input,
.card-body select,
.card-body textarea {
  width: 95%;
  padding: 12px;
  border: 1px solid rgba(198, 163, 79, 0.25);
  border-radius: 8px;
  font-size: 14px;
  margin-bottom: 10px;
  background: #fffef8;
  color: #2c3e50;
  transition: all 0.2s ease;
}
.card-body input:focus,
.card-body select:focus,
.card-body textarea:focus {
  border-color: #A3822F;
  outline: none;
  box-shadow: 0 0 0 3px rgba(198, 163, 79, 0.18);
}

/* === BOTONES === */
.save-btn {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 700;
  transition: all 0.2s ease;
  box-shadow: 0 8px 18px rgba(163, 130, 47, 0.12);
}
.save-btn:hover {
  background: linear-gradient(135deg, #EDC94F, #C6A34F);
  transform: translateY(-2px);
  box-shadow: 0 10px 24px rgba(163, 130, 47, 0.18);
}
.save-btn:active {
  transform: translateY(0);
}

.cancel-btn {
  background: transparent;
  color: #4b3d09;
  border: 1px solid rgba(163, 130, 47, 0.25);
  padding: 10px 16px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  margin-left: 8px;
}
.cancel-btn:hover {
  background: rgba(198, 163, 79, 0.06);
}

/* === BOTONES AGRUPADOS === */
.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  margin-top: 15px;
}

/* === RESPONSIVE === */
@media (max-width: 520px) {
  .card {
    padding: 18px;
  }
  .card-icon {
    width: 44px;
    height: 44px;
  }
  .save-btn,
  .cancel-btn {
    font-size: 13px;
    padding: 9px 14px;
  }
}
</style>
