<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal</title>
    <link rel="stylesheet" href="Vista/menu.css">

</head>
<body>
    <header class="header">

        <div class="menu container ">

            <a href="<%= request.getContextPath() %>menu.jsp" class="logo"> THEGC
                <img src="<%= request.getContextPath() %>/Vista/imagen/navaja.png" alt="Logotipo de The Gentleman’s Club">
            </a>
            <input type="checkbox" id="menu"/>
            <label for="menu">
            </label>

            <nav class="navbar">
                <ul>
                    <li><a href="menu.jsp">Inicio
                        <img src="<%= request.getContextPath() %>/Vista/imagen/casa.png">
                    </a></li>
                    <li><a href="mis_clientes.jsp">Mis Clientes
                        <img src="<%= request.getContextPath() %>/Vista/imagen/clientes.png">
                    </a></li>
                    <li><a href="mis_citas.jsp">Mis Citas
                        <img src="<%= request.getContextPath() %>/Vista/imagen/calendario.png">
                    </a></li>
                </ul>
            </nav>
            

            
        </div>
        <div class="header- content container">
            <div class="header-txt">
                <h1>The Gentleman’s Club</h1>
                <p>Donde el Estilo se Encuentra con la Tradición</p>
                    <a href="#" class="btn-1">Agenda con Nosotros </a>
                </div>
                
        </div>

    </header>


    <section class="abot">
        <div class="about-content container">

            <div class="about-txt">
                <span>The Gentleman’s Club</span>
                <h2>Tu refugio de estilo y distinción. Siéntete como en casa, caballero.

                </h2>
                <hr>
               
            </div>
            <div class=" about-img">
                <img src="<%= request.getContextPath() %>/Vista/imagen/tiempo.jpg">
            </div>

        </div>


    </section>
    <section class="testimonial">
        <span>Barber</span>
        <div class="testimonial-content- container">
            <div class="testimonial-1">
                <img   class="face" src="Vista/imagen/Barbershop.jpg">
                <h4>Bienvenido, caballero. Hoy vamos a darte el estilo que mereces.</h4>
                   
            </div>
           


        </div>

    </section>

    <main class="plans">

        <span>The Gentleman’s Club</span>
        <h2>Nuestros paquetes</h2>
        <hr>
        <div class="plans-content container">
            <div class="plan-1">
                <span> ₡5,000</span>
                <h3>The Quick Cut</h3>
                <p></p>
                <p>Corte de cabello</p>
                <p>Peinado sencillo</p>
                
            </div>
            <div class="plan-1">
                <span>₡10,000</span>
                <h3>The Sharp Look</h3>
                <p></p>
                <p>Corte de cabello</p>
                <p>Afeitado o arreglo de barba</p>
                <P>Peinado con productos premium</P>
                

                
            </div>
            <div class="plan-1">
                <span>₡15,000</span>
                <h3>Distinguished</h3>
                <p></p>
                <p>Corte de cabello</p>
                <p>Afeitado o perfilado de barba con toalla caliente</p>
                <P>Peinado y finalización con productos de alta calidad</P>
                <P>Masaje de cuello y hombros</P>
                <p>Trago de cortesía</p>

                
            </div>
        </div>

    </main>
    

    <section class="blog">
        <span>The Gentleman’s Club</span>
        <div class="blog-content container">

            <div class="blog-1">
                <img src="<%= request.getContextPath() %>/Vista/imagen/Elvis.jpg">
                <div class="blog-txt">
                    <span>La barbería que nunca duerme.</span>
                    <h3>Porque el estilo no tiene horario.</h3>
                  
                </div>
            </div>
            <div class="blog-1">
                <img src="<%= request.getContextPath() %>/Vista/imagen/Flow.jpg">
                <div class="blog-txt">
                    <span>Old school con un toque de ciudad.</span>
                    <h3>Inspirado en los grandes de ayer, pensado para el caballero de hoy.</h3>
                    
                </div>
            </div>
            <div class="blog-1">
                <img src="<%= request.getContextPath() %>/Vista/imagen/David.jpg">
                <div class="blog-txt">
                    <span>Porque un caballero siempre lleva el estilo de su ciudad.</span>
                    <h3>Refinamiento con actitud de metrópoli.</h3>
                    
                </div>
            </div>
        </div>

    </section>

   
    <footer class="footer">
        <div class="footer-content container">


       
        <div class="link">
            <ul>
                <li><a href="#">Encuentranos en Facebook</a></li>
            </ul>
        </div>
        <div class="link">
           
            <ul>
                <li><a href="#">Encuentranos en Instagram</a></li>
            </ul>
        </div>
        <div class="link">
           
            <ul>
                <li><a href="#">Escribenos a nuestro WhatsApp</a></li>
            </ul>
        </div>
    </div>


    </footer>
   

        </form>
       
        </table>
       



    <script src="Controlador/menu.js"></script>

</body>
</html>