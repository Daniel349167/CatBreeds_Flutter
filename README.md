# Catbreeds App

## Descripción

Esta aplicación muestra una lista de razas de gatos utilizando la API de [TheCatAPI](https://api.thecatapi.com/v1/breeds). Los usuarios pueden buscar por nombre de raza y visualizar detalles de cada raza seleccionada. 

## Requerimientos

- Flutter 2.x o superior
- API Key de [TheCatAPI](https://thecatapi.com) (incluida en el código como header `x-api-key`)

## Configuración y Ejecución

1. Clona este repositorio:
    ```bash
    git clone https://github.com/usuario/catbreeds_app.git
    cd catbreeds_app
    ```

2. Instala las dependencias del proyecto:
    ```bash
    flutter pub get
    ```

3. Corre el proyecto en tu dispositivo/emulador:
    ```bash
    flutter run --release
    ```

4. Si no tienes configurado un dispositivo, puedes usar:
    ```bash
    flutter emulators --launch nombre_del_emulador
    ```

## Estructura de la Aplicación

### Pantallas

1. **Splash Screen**: Pantalla de bienvenida con una imagen de un gato y el título de la app.
2. **Landing Page**: Muestra una lista de razas de gatos en tarjetas (cards), cada una con el nombre, país de origen e inteligencia.
3. **Detalle de la Raza**: Pantalla que muestra la imagen del gato, una descripción y más información sobre la raza, con funcionalidad de scroll para ver todos los datos.

### API

La información se obtiene desde la API de [TheCatAPI](https://developers.thecatapi.com/), la cual requiere un API Key para funcionar. Este key está incluido en el código bajo el header `x-api-key`.

## Notas Importantes

- La primera imagen en la lista de razas tiene un texto suficientemente largo en la descripción para probar la funcionalidad de scroll en la pantalla de detalles.
- La imagen no se puede mover en la pantalla de detalles, pero el texto sí tiene scroll hacia abajo para visualizar más información.

## Imágenes de la App

## Imágenes de la App

<p style="display: flex; justify-content: space-between;">
  <img src="https://github.com/user-attachments/assets/7c156d33-ff28-478b-ba24-18a68c27ed11" width="30%" />
  <img src="https://github.com/user-attachments/assets/dfa8020e-f619-43f7-99ce-5ab5aefdab93" width="30%" />
  <img src="https://github.com/user-attachments/assets/80e071dc-0b50-4c82-b421-9e3e5e3ad3de" width="30%" />
</p>






