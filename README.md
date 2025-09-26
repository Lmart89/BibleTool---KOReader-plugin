
# 📖 BibleTool – KOReader Plugin

BibleTool es un **plugin para [KOReader](https://github.com/koreader/koreader)** diseñado para ofrecer un entorno sencillo de **lectura, búsqueda y organización de la Biblia** directamente en tu eReader o dispositivo compatible.

El objetivo de este proyecto es proveer una herramienta de estudio biblico que pueda ejecutarse de forma casi universal en cualquier eBook reader, sin necesidad de recurrir
al uso de toolchains de compilacion cruzada o de realizar modificaciones complejas al sistema, usando el framework que proporciona KOReader permitiendo un desarrollo e integracion mucho mas sencilla, asi como su mejora y actualizacion.

Actualmente esta siendo desarrollada como un plugin de KOReader, con miras al futuro de ser una aplicacion stand-alone bajo el framework de KOREader-base con una interfaz limpia y ligera al proposito de BibleTool.

https://github.com/Lmart89/BibleTool---KOReader-plugin/blob/main/bibletool-alpha-r1.png

## ✨ Características (versión actual)

✅ Aparición en el **menú principal** de KOReader.  
✅ Pantalla inicial con un **submenú interactivo**.  
✅ Secciones base para:  
- 📖 **Leer Biblia**  
- 🔍 **Buscar pasajes**  
- ⭐ **Favoritos**  
- 📝 **Notas**  

*(Actualmente en desarrollo, varias funciones son placeholders para pruebas.)*

---

## 📦 Instalación

1. Clona o descarga este repositorio.  
2. Copia la carpeta `bibletool` dentro de tu directorio de plugins de KOReader:

koreader/plugins/bibletool.koplugin/

El archivo principal debe quedar como:

koreader/plugins/bibletool.koplugin/main.lua

3. Reinicia KOReader.  
4. Abre el **menú principal** y deberías ver la nueva opción: **BibleTool**.

---

## 🚀 Uso

- Ingresa al menú de KOReader.  
- Selecciona **BibleTool**.  
- Explora las secciones disponibles:  
- **Leer Biblia** → pantalla de prueba para futuros textos.  
- **Buscar pasaje** → función de búsqueda (en construcción).  
- **Favoritos** → lista de versículos destacados.  
- **Notas** → espacio para anotaciones personales.  

---

## 🛠️ Desarrollo

BibleTool está escrito en **Lua**, siguiendo el framework de KOReader para plugins.  
Actualmente se apoya en:

- `WidgetContainer` → para integrarse en la UI de KOReader.  
- `MenuPage` / `KeyValuePage` → para construir pantallas interactivas.  
- `UIManager` → para manejar la navegación entre pantallas.  

Estructura del plugin:

bibletool/
├── main.lua # Plugin principal

## 🤝 Contribuciones

¡Toda ayuda es bienvenida! 🙌  
Si deseas colaborar:

1. Haz un fork del repositorio.  
2. Crea una rama con tus cambios:
   git checkout -b feature/nueva-funcion
Haz commit y push:

git commit -m "Agregada función X"
git push origin feature/nueva-funcion
Abre un Pull Request.

📅 Roadmap
 Integración de texto bíblico completo.

 Implementar motor de búsqueda por libro/capítulo/versículo.

 Soporte para favoritos persistentes.

 Sistema de notas vinculadas a pasajes.

 Exportar favoritos y notas en formatos de texto.

📜 Licencia
Este proyecto está liberado bajo la GPL3 License.
Eres libre de usarlo, modificarlo y compartirlo bajo los términos de dicha licencia.

✍️ Proyecto creado por Luis E. Martínez (2025) como parte del desarrollo de su lector BibleTool para KOReader.
