<?php
include_once('../../Enviroment/Autenticacion.php');
$sesion = new Sesion();
$sesion->autenticacion();
?>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Empresa Auditoria</title>

  <!-- Custom fonts for this template-->
  <link href="../../Library/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../Css/sb-admin-2.min.css" rel="stylesheet">

  <!--datables CSS básico-->
  <link rel="stylesheet" type="text/css" href="../../Library/vendor/datatables/datatables.min.css"/>

  <!--datables estilo bootstrap 4 CSS-->
  <link rel="stylesheet"  type="text/css" href="../../Library/vendor/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

  <!--Css propios-->
  <link href="../../Css/estiloP.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
        <div class="sidebar-brand-icon rotate-n-15">
          <!-- <i class="fas fa-chart-pie"></i> -->
          <i class="far fa-chart-bar"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Empresa Auditoria</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">


      <li class="nav-item active">
        <p class="nav-link" href="inde.php">
          <select class="form-control" id="selectRol">
          </select>
        </p>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <li class="nav-item" id="acceso">
        <div></div>
      </li>
      <hr class="sidebar-divider d-none d-md-block">

      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>



          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Cerrar Sesión  -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?php echo $_SESSION["nombre"];?></span>
                <!-- Imagen perfil usuario -->
                <img class="img-profile rounded-circle" src="../../img/user.png">
              </a>

              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Cerrar Sesión
                </a>
                <a class="dropdown-item" href="###" target='main' data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Configuraciones
                </a>
              </div>
            </li>
          </ul>
        </nav>

        <main>
          <iframe name="main" id="iframe" src="" frameborder="0" scrolling="no"></iframe>
        </main>

      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Modal cerrar Sesión-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">¿Esta seguro de cerrar sesión?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          <a class="btn btn-primary" href="../../Controller/Autenticacion/Logout.C.php">Salir</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Código JavaScript-->
  <script src="../../Library/vendor/jquery/jquery.min.js"></script>
  <script src="../../Library/bootstrap/js/bootstrap.bundle.min.js"></script>


  <script src="../../Library/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../Js/sb-admin-2.min.js"></script>

  <!-- datatables JS -->
  <script src="../../Library/vendor/datatables/datatables.min.js"></script>

  <!-- código propio JS -->
  <script src="../../Js/Autenticacion/Roles.js"></script>

</body>
</html>
