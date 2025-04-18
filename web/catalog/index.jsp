<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rent Easy - Your Best Choice for Car Rentals</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <style>
        .fixed-img {
            height: 200px; /* Fixed height for all images */
            object-fit: cover; /* Ensures the image covers the specified area without distortion */
            width: 100%; /* Ensures the image spans the full width of the card */
        }

    </style>
    </head>
    
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">Rent Easy</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="catalog.jsp">Catalog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <header class="bg-primary text-white text-center py-5">
            <div class="container">
                <h1 class="display-4">Rent Easy: Your Perfect Ride Awaits</h1>
                <p class="lead">Experience hassle-free car rentals at unbeatable prices</p>
                <a href="catalog.jsp" class="btn btn-light btn-lg">Browse Our Catalog</a>
            </div>
        </header>

        <!-- Catalog Section -->
        <section id="catalog" class="py-5">
            <div class="container">
                <h2 class="text-center mb-5">Our Catalog</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top fixed-img" alt="Economy Car">
                            <div class="card-body">
                                <h5 class="card-title">Economy Car</h5>
                                <p class="card-text">Perfect for city driving and fuel efficiency.</p>
                                <a href="#" class="btn btn-primary">Rent Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://images.pexels.com/photos/1592261/pexels-photo-1592261.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top fixed-img" alt="SUV">
                            <div class="card-body">
                                <h5 class="card-title">SUV</h5>
                                <p class="card-text">Ideal for family trips and outdoor adventures.</p>
                                <a href="#" class="btn btn-primary">Rent Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top fixed-img" alt="Luxury Sedan">
                            <div class="card-body">
                                <h5 class="card-title">Luxury Sedan</h5>
                                <p class="card-text">Experience comfort and style on your journey.</p>
                                <a href="#" class="btn btn-primary">Rent Now</a>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="text-center mt-4">
                    <a href="#" class="btn btn-outline-primary btn-lg">View Full Catalog</a>
                </div>
            </div>
        </section>

        <!-- About Us Section -->
        <section id="about" class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center mb-5">About Rent Easy</h2>
                <div class="row">
                    <div class="col-lg-6">
                        <p>Rent Easy is your trusted partner for all your car rental needs. With a wide range of vehicles and a commitment to customer satisfaction, we make renting a car easy and enjoyable.</p>
                        <p>Our mission is to provide high-quality, well-maintained vehicles at competitive prices, ensuring that your journey is comfortable, safe, and hassle-free.</p>
                    </div>
                    <div class="col-lg-6">
                        <h4>Why Choose Rent Easy?</h4>
                        <ul>
                            <li>Wide selection of vehicles</li>
                            <li>Competitive pricing</li>
                            <li>Excellent customer service</li>
                            <li>Flexible rental options</li>
                            <li>Clean and well-maintained fleet</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="py-5">
            <div class="container">
                <h2 class="text-center mb-5">Contact Us</h2>
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <h4>Get in Touch</h4>
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="4" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Send Message</button>
                        </form>
                    </div>
                    <div class="col-md-6 mb-4">
                        <h4>Our Location</h4>
                        <p>123 Car Rental Street<br>Anytown, ST 12345<br>United States</p>
                        <h4>Contact Information</h4>
                        <p>Phone: (123) 456-7890<br>Email: info@renteasy.com</p>
                        <h4>Business Hours</h4>
                        <p>Monday - Friday: 8:00 AM - 8:00 PM<br>Saturday - Sunday: 9:00 AM - 6:00 PM</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-4">
            <div class="container">
                <p>&copy; 2024 Rent Easy. All rights reserved.</p>
                <div class="social-icons">
                    <a href="#" class="text-white me-3"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-white me-3"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="bi bi-instagram"></i></a>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>