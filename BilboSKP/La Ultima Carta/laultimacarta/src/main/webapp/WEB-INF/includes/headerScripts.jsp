<!-- JavaScript for Scroll Animation and Menu -->
<script>
        // Scroll Header Effect
        window.addEventListener('scroll', function() {
            const header = document.getElementById('main-header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // Hamburger Menu Toggle
        document.querySelector('.hamburger-menu').addEventListener('click', function() {
            this.classList.toggle('active');
            document.querySelector('.nav-container').classList.toggle('active');
            document.body.classList.toggle('menu-open');
        });

        // Close Menu on Link Click
        document.querySelectorAll('nav ul li a').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelector('.hamburger-menu').classList.remove('active');
                document.querySelector('.nav-container').classList.remove('active');
                document.body.classList.remove('menu-open');
            });
        });
</script>