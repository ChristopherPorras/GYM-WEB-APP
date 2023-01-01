using DataAccess.CRUD;
using DTO;
using System;
using System.Collections.Generic;

namespace BL
{
    public class UsuarioRoleManager
    {
        private readonly UsuarioRoleCrudFactory _usuarioRoleCrudFactory;

        public UsuarioRoleManager()
        {
            _usuarioRoleCrudFactory = new UsuarioRoleCrudFactory();
        }

        public void CreateUsuarioConRol(UsuarioRole usuarioRole)
        {
            _usuarioRoleCrudFactory.Create(usuarioRole);
        }

        public UsuarioRole GetUsuarioRoleByEmail(string correoElectronico)
        {
            return _usuarioRoleCrudFactory.RetrieveByEmail(correoElectronico);
        }

        public List<UsuarioRole> GetAllUsuariosConRoles()
        {
            var usuariosRoles = _usuarioRoleCrudFactory.RetrieveAll<UsuarioRole>();
            return usuariosRoles;
        }

        public void UpdateUsuarioRole(UsuarioRoleUpdate usuarioRole)
        {
            _usuarioRoleCrudFactory.Update(usuarioRole);
        }

        public void DeleteUsuarioRole(UsuarioRole usuarioRole)
        {
            _usuarioRoleCrudFactory.Delete(usuarioRole);
        }

        public void DesactivarUsuarioRole(string correoElectronico)
        {
            var usuarioRole = _usuarioRoleCrudFactory.RetrieveByEmail(correoElectronico);
            if (usuarioRole != null)
            {
                var usuarioRoleUpdate = new UsuarioRoleUpdate
                {
                    OriginalCorreoElectronico = usuarioRole.CorreoElectronico,
                    CorreoElectronico = usuarioRole.CorreoElectronico,
                    Nombre = usuarioRole.Nombre,
                    FechaRegistro = usuarioRole.FechaRegistro,
                    Telefono = usuarioRole.Telefono,
                    TipoUsuario = usuarioRole.TipoUsuario,
                    Estado = false,  // Cambia el estado del usuario a desactivado
                    HaPagado = usuarioRole.HaPagado,
                    CorreoVerificado = usuarioRole.CorreoVerificado,
                    TelefonoVerificado = usuarioRole.TelefonoVerificado,
                    RolId = usuarioRole.RolId
                };

                _usuarioRoleCrudFactory.Update(usuarioRoleUpdate);
            }
        }

    }
}
