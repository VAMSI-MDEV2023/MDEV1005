const homeLink = document.getElementById("homeLink");
        const aboutLink = document.getElementById("aboutLink");
        const serivceLink = document.getElementById("serivceLink");
      
        
        homeLink.addEventListener("click", function(event) {
          event.preventDefault(); // Prevent the default link behavior
          window.location.href = "Homepage.html"; // Redirect to the home page
        });
      
        aboutLink.addEventListener("click", function(event) {
          event.preventDefault();
          window.location.href = "Aboutpage.html"; // Redirect to the about page
        });
      
        serivceLink.addEventListener("click", function(event) {
          event.preventDefault();
          window.location.href = "Servicepage.html"; // Redirect to the service page
        });

        reportLink.addEventListener("click", function(event) {
          event.preventDefault();
          window.location.href = "Reportpage.html"; // Redirect to the report page
        });

        
      