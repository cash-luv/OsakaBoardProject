<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white"  id="footer"></p>
        </div>
        <!-- /.container -->
    </footer>
</footer>
<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("footer");
    footer.innerHTML = "<p>&copy; " + date.getFullYear() + "&nbsp; HRDKOREA  All rights reserved. </p>";
</script>
