// Simulación de archivos subidos (debería ser reemplazado por backend real)
let archivos = [
    { nombre: "ejemplo1.pdf", url: "#" },
    { nombre: "foto-vacaciones.jpg", url: "pony.jfif", tipo: "imagen" },
    { nombre: "documento.txt", url: "#" }
];

function mostrarArchivos() {
    const fileListSection = document.getElementById('fileListSection');
    const fileList = document.getElementById('fileList');
    fileList.innerHTML = '';
    if (archivos.length > 0) {
        fileListSection.style.display = 'block';
        archivos.forEach(archivo => {
            const li = document.createElement('li');
            if (archivo.tipo === "imagen") {
                li.innerHTML = `
                    <span>
                        <img src="${archivo.url}" alt="Vista previa" style="height:40px;vertical-align:middle;border-radius:6px;margin-right:10px;">
                        ${archivo.nombre}
                    </span>
                    <a href="${archivo.url}" download>Descargar</a>
                `;
            } else {
                li.innerHTML = `<span>${archivo.nombre}</span> <a href="${archivo.url}" download>Descargar</a>`;
            }
            fileList.appendChild(li);
        });
    } else {
        fileListSection.style.display = 'none';
    }
}

document.getElementById('uploadForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const input = document.getElementById('fileInput');
    if (input.files.length > 0) {
        const archivo = input.files[0];
        let nuevoArchivo = { nombre: archivo.name, url: "#" };
        if (archivo.type.startsWith("image/")) {
            // Mostrar vista previa local
            const reader = new FileReader();
            reader.onload = function (ev) {
                nuevoArchivo.url = ev.target.result;
                nuevoArchivo.tipo = "imagen";
                archivos.push(nuevoArchivo);
                mostrarArchivos();
            };
            reader.readAsDataURL(archivo);
        } else {
            archivos.push(nuevoArchivo);
            mostrarArchivos();
        }
        input.value = '';
        alert('Archivo subido (simulado). Implementa el backend para funcionalidad real.');
    }
});

// Mostrar archivos al cargar
mostrarArchivos();