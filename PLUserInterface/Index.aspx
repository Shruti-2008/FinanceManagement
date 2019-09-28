<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PLUserInterface.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }

        .carousel-inner img {
            width: 100%; /* Set width to 100% */
            margin: auto;
            min-height: 200px;
        }

        /* Hide the carousel text when the screen is less than 600 pixels wide */
        @media (max-width: 600px) {
            .carousel-caption {
                display: none;
            }
        }

        .carousel {
            width: 100%;
            height: 50%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <asp:Image ImageUrl="images1/c1.jpg" ID="Image2" runat="server" />
            </div>
            <div class="carousel-item">
                <asp:Image ImageUrl="images1/c2.jpg" ID="Image3" runat="server" />
            </div>
            <div class="carousel-item">
                <asp:Image ImageUrl="images1/c3.jpg" ID="Image4" runat="server" />
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>



    <section id="whyus">
        <div class="container text-center">
            <h3>Why Us</h3>
            <br/>
            <div class="row">
                <div class="col-sm-4">
                    <img src="images1/d1.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
                <div class="col-sm-4">
                    <img src="images1/d2.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
                <div class="col-sm-4">
                    <img src="images1/d3.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-sm-4">
                    <img src="images1/d4.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
                <div class="col-sm-4">
                    <img src="images1/d5.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
                <div class="col-sm-4">
                    <img src="images1/d6.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
                        Know More
                    </button>
                </div>
            </div>
        </div>
    </section>
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <section class="success" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2>About</h2>
                        <hr class="star-light" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-2">
                        <p>TOM FINANCE aims to be one of the most efficient distributor of financial services. Efficiency in general describes the extent to which time, effort (labor) or cost (money) is well used for the intended task or purpose. It means optimum use of available resources & to generate the best possible productivity by them. We firmly believe that even the biggest company can collapse if they are not efficiency-conscious and even the smallest company can be a superpower if they pay attention to increasing their efficiency.</p>
                    </div>
                    <div class="col-lg-4">
                        <p>Any business unit should primarily focus on increasing the value of all its stake holders. The company should, from time to time, adopt and adapt to such business models where it can accomplish this very important and essential goal of creating value on a very large scale.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <br>
    <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Personal Loan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    INFORMATION GOES HERE.
                </div>
            </div>
        </div>
    </div>

    <section id="contact">
        <footer class="text-center">
            <div class="footer-above">
                <div class="container">
                    <div class="row">
                        <div class="footer-col col-md-4">
                            <h3>Location</h3>
                            <p>
                                Plot No. EL-200, TTC Electronic Zone Shil Phata - Mahape Road<br>
                                Kopar Khairane, MIDC Industrial Area, Mahape, Navi Mumbai, Maharashtra 400710
                            </p>
                        </div>
                        <div class="footer-col col-md-4">
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>We are always there</h3>
                            <p>Call our toll free number : 022-45645645 for any enquiry</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </section>

</asp:Content>
