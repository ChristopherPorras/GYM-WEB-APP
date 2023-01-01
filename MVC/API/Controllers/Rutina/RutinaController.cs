using BL;
using DTO;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Text;
using System.Threading.Tasks;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RutinaController : ControllerBase
    {
        private readonly RutinaManager _manager;
        private readonly IEmailSender _emailSender;

        public RutinaController(RutinaManager manager, IEmailSender emailSender)
        {
            _manager = manager;
            _emailSender = emailSender;
        }

        [HttpPost("CreateRutina")]
        public IActionResult CreateRutina([FromBody] RutinaDTO rutina)
        {
            try
            {
                if (string.IsNullOrEmpty(rutina.CorreoElectronico))
                {
                    return BadRequest("Correo electrónico del cliente es obligatorio.");
                }

                if (string.IsNullOrEmpty(rutina.EntrenadorCorreo))
                {
                    return BadRequest("Correo electrónico del entrenador es obligatorio.");
                }

                _manager.Create(rutina);
                return Ok("Rutina creada exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al crear la rutina: {ex.Message}");
            }
        }

        [HttpGet("GetRutina/{id}")]
        public IActionResult GetRutina(int id)
        {
            var rutina = _manager.RetrieveById<RutinaDTO>(id);
            return Ok(rutina);
        }

        [HttpGet("GetAllRutinas")]
        public IActionResult GetAllRutinas()
        {
            var rutinas = _manager.RetrieveAll<RutinaDTO>();
            return Ok(rutinas);
        }

        [HttpPut("UpdateRutina")]
        public IActionResult UpdateRutina([FromBody] RutinaDTO rutina)
        {
            _manager.Update(rutina);
            return Ok("Rutina actualizada exitosamente");
        }

        [HttpDelete("DeleteRutina/{id}")]
        public IActionResult DeleteRutina(int id)
        {
            _manager.Delete(new RutinaDTO { ID = id });
            return Ok("Rutina eliminada exitosamente");
        }

        [HttpPost("SendRutinaPdf")]
        public async Task<IActionResult> SendRutinaPdf([FromBody] EmailDto emailDto)
        {
            try
            {
                if (string.IsNullOrEmpty(emailDto.ToEmail))
                {
                    return BadRequest("El destinatario del correo es obligatorio.");
                }

                // Crear un mensaje personalizado
                var message = new StringBuilder();
                message.AppendLine($"Estimado/a {emailDto.ToEmail},");
                message.AppendLine();
                message.AppendLine("Se le ha asignado la siguiente rutina de ejercicios:");
                message.AppendLine(emailDto.Message);  // Aquí se incluye la rutina en texto
                message.AppendLine();
                message.AppendLine("¡Esperamos que disfrute su entrenamiento!");
                message.AppendLine();
                message.AppendLine("Saludos,");
                message.AppendLine("Su equipo de acondicionamiento físico");

                // Enviar el correo sin adjuntos
                await _emailSender.SendEmailAsync(emailDto.ToEmail, "Su nueva rutina de ejercicios", message.ToString());

                return Ok("Mensaje enviado correctamente");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error al enviar el mensaje: {ex.Message}");
            }
        }
    }
}
