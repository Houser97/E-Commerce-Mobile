# E Commerce mobile App using flutter, C# and JWT

API datasource: https://dummyjson.com/products

## Notas
### StateNotifier, inicialización llamando al método en init
- Si se llama a un método del provider en init entonces se debe hacer un delay para esperar a que el Widget se renderice antes de mofificar el estado.