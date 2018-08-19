# Simple e-commerce

### Descripción 
- E-commerce creado from-scratch el cual simula la compra-venta de artículos. Construído a partir del libro Agile Web Development with Rails 5.1 https://pragprog.com/book/rails51/agile-web-development-with-rails-5-1

### Características
- Creación de articulos
- Sistema de actualización de articulos en tiempo real utilizando Action Cable
- Uso de React para el sistema de pago
- Envío de Email previa orden de compra
- I18n

### Adicional
- Para configurar el email se debe establecer este más su password en el archivo `config/application.yml` y remover el comentario de la línea 55 en el archivo `app/controllers/appointments_controller.rb`
- El login de ingreso es ```/login```

### Usuario por defecto
- admin , contraseña : admin123

### Instalación
```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
### Imágenes
<img src="https://i.imgur.com/68ekhLf.png" />
<br>
<img src="https://i.imgur.com/zQ3HhOz.png" />
<br>
<img src="https://i.imgur.com/tg93cnw.png" />
