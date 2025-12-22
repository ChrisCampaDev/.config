Objetivo: Usar la Poke Api de internet y crear una web con un diseno y arquitectura similar a ALCOM para practicar y adaptarse para trabajar en el futuro

URL: https://pokeapi.co/
### Tecnologias a usar:
1. React 
2. Git
3. Vitejs
4. MaterialUI
5. axios
6. MobX-Observer 
7. AG grid React
8. Material Icon Design
9. react-router
10. Git Extension

### Tiempo estimado: En dependencia de ustedes, lo maximo que pido es 1 mes de desarrollo para que tambien estudien, experimenten y me coman a dudas.

Tareas
Desarrollar una web interactiva con los datos de los distintos pokemons, las regiones y movimientos. En esta web el usuario podra tener un listado de pokemons favoritos y crear un equipo propio. Se mostraran los distintos pokemons en una tabla y se podran ver mas datos de el pokemon  seleccionado en una pantalla aparte.
En la pantalla de detalles del pokemon se mostrara mas informacion y se permitira al usuario agregarlo o quitarlo de favoritos, asi como agregarlo al equipo pokemn. 
El equipo pokemon tendra un limite de 6 pokemons, no se podra agregar mas de 6. Mientras que no hay limites para agregar pokemons favoritos. Se podra agregar a mas de un pokemon a la vez al equipo o a los favoritos usando un boton que debe estar deshabilitado en caso de no haber seleccionado mas de 1 pokemon.
La web no solo dara informacion de los pokemons, tambien de las distintas bayas que existen en los juegos. Para esto se hara un menu lateral (Drawer) que permita navegar por distintas pantallas principales que tendran un diseno similar con una tabla con datos y botones de accion para mostrar mas informacion.

PD: La aplicacion web sera personal, yo la revisare cada vez que gusten y hayan hecho un avance. Cuando creen el proyecto yo ire agregando componentes que se usan en ALCOM que podran reutilizar en el proyecto de PokeApi (como el datatable y un store de ejemplo)

Diseno a seguir:
1. El color puedes usar el que guste y aplicar mas detalles.
2. Mostrar en la pagina inicial una tabla con los nombres de los pokemons
	1. En la tabla debe haber un menu de acciones que permitiria visualizar los pokemons
	2. Tambien debe haber un icono para guardar a los pokemons favoritos
### Organizacion de ramas

- Rama principal: ***main***  => Esta rama tendra los componentes y cambios estables, Todo modulo agregado y que sea testeado y no de error estara en main
- Rama principal: ***dev***  => Esta rama tendra los componentes y cambios en prueba
- Rama principal: ***Personal***  => Esta rama saldra de la rama DEV, no de la main, tendra los componentes y cambios en que se estan trabajando, estos cambios seran luego pasados para la rama Dev para estar a prueba a traves de un Pull Request. Cada uno tendra su rama personal y cada cierto tiempo tendran que comprobar que tienen minimas diferencias haciendo un merge a Dev 

### Estructura del Proyecto
La arquitectura propuesta puede adaptarse en dependencia de las necesidades

```
src/
├── assets/           # Recivos estáticos (imágenes, fuentes, etc.)
├── core/             # Núcleo de la aplicación
│   ├── apiRest/      # Clientes y configuraciones de API REST
│   ├── components/   # Componentes reutilizables
│   ├── context/      # Contextos de React
│   ├── form/         # Lógica de formularios
│   ├── hooks/        # Custom hooks
│   ├── notifications/# Sistema de notificaciones
│   ├── stores/       # Tiendas de estado
│   ├── types/        # Definiciones de tipos TypeScript
│   └── utils/        # Utilidades y helpers
├── layouts/          # Componentes de diseño
└── modules/          # Módulos de la aplicación
```

## Ejemplos 
### Implementación del Store General

```typescript
// src/core/stores/GeneralApplicationStore.ts
import { makeAutoObservable } from 'mobx';

class GeneralApplicationStore {
  isLoading = false;
  error: string | null = null;
  currentUser: User | null = null;

  constructor() {
    makeAutoObservable(this);
  }

  // Actions
  setLoading = (isLoading: boolean): void => {
    this.isLoading = isLoading;
  };

  setError = (error: string | null): void => {
    this.error = error;
  };

  setCurrentUser = (user: User | null): void => {
    this.currentUser = user;
  };

  // Computed values
  get isAuthenticated(): boolean {
    return this.currentUser !== null;
  }
}

export default new GeneralApplicationStore();
```

#### Uso con un useContext 
``` typescript
import { createContext } from 'react';

import { GeneralApplicationStore } from 'store/GeneralApplicationStore'

export const GeneralApplicationStore = createContext<GeneralApplicationStoreType>(new GeneralApplicationStore());
 
```

### Uso en Componentes

``` typescript
// Ejemplo de uso en un componente React
import { observer } from 'mobx-react-lite';
import generalStore from '@core/context/GeneralApplicationStore';

const UserProfile = observer(() => {
const store = useContext(generalStore)
  if (store.isLoading) {
    return <div>Cargando perfil...</div>;
  }

  if (!store.isAuthenticated) {
    return <div>Por favor inicia sesión</div>;
  }

  return (
    <div>
      <h2>Bienvenido, {store.currentUser?.name}</h2>
      <p>Email: {generalStore.currentUser?.email}</p>
    </div>
  );
});

```
