# Guía para Principiantes: React, TypeScript y las dependencias del proyecto

**1) ¿Qué es React?**
React es una biblioteca para construir interfaces de usuario (pantallas) en la web. Permite dividir la interfaz en piezas reutilizables llamadas “componentes”. Cada componente muestra información en pantalla y puede reaccionar a las acciones del usuario (por ejemplo, al hacer clic en un botón).

Documentación oficial: https://react.dev/

**2) Conceptos fundamentales de React (sin código)**
- Componentes: son “bloques” que componen la pantalla. Piensa en un encabezado, un menú o una tarjeta de información. Cada uno puede ser un componente.
- Propiedades (props): son datos que un componente recibe del “exterior” para mostrar o decidir qué hacer. Por ejemplo, el título de una tarjeta.
- Estado (state): son datos internos del componente que pueden cambiar mientras la aplicación está en uso. Por ejemplo, si un panel está abierto o cerrado.
- Renderización: es el proceso por el que React transforma datos en elementos visibles en la pantalla. Cuando cambian los datos, React vuelve a “pintar” lo necesario.

**3) Hooks de React (qué son y para qué sirven)**
Los “hooks” son funciones especiales que dan superpoderes a los componentes sin usar clases.
- useState: guarda un valor que puede cambiar mientras usas la app (por ejemplo, si un panel está abierto).
- useEffect: realiza tareas “secundarias” como consultar datos al servidor o programar temporizadores.
- useContext: permite que un componente lea información “global” compartida (por ejemplo, el usuario autenticado o la configuración de la app).
- Suspense y lazy: ayudan a cargar partes de la app bajo demanda y mostrar un “cargando…” mientras tanto. Esto mejora el rendimiento.

Documentación oficial de hooks: https://react.dev/reference/react

**4) ¿Qué es TypeScript y por qué lo usamos?**
TypeScript es un “superconjunto” de JavaScript que añade tipos. Los tipos ayudan a que el código sea más claro y a detectar errores antes de ejecutar la aplicación. En términos simples, describimos la forma de los datos (por ejemplo, que algo es un texto, un número o un objeto con ciertos campos) y el editor puede avisarnos si intentamos usar esos datos de forma incorrecta.

Conceptos básicos de TypeScript (sin código):
- Tipos primitivos: texto, número, verdadero/falso, etc.
- Interface: describe la forma de un objeto, útil para “propiedades” de un componente o datos estructurados.
- Type (alias): nombre corto para una forma de dato, también se usa para combinaciones como “una cosa o la otra”.
- Genéricos: plantillas de tipos para reutilizar estructuras en distintas situaciones.

Documentación oficial: https://www.typescriptlang.org/

5) ¿Qué dependencias usa este proyecto y para qué sirven?
A continuación, una lista de las herramientas más importantes que verás en el proyecto y su función:
- React y React DOM: la base para crear interfaces de usuario web. React gestiona los componentes y React DOM se encarga de “pintarlos” en el navegador.
- TypeScript: añade tipos para que el código sea más claro y seguro.
- MobX: una librería para gestionar el estado (los datos) de manera reactiva. Facilita que cuando cambien los datos, la interfaz se actualice automáticamente.
- mobx-react-lite: conecta MobX con React. Permite que los componentes “observen” los datos y se actualicen cuando estos cambian.
- Material UI (MUI): colección de componentes visuales listos para usar (botones, tablas, diálogos, etc.), con diseño moderno y accesible.
- React Router (si está presente): organiza la navegación entre pantallas (por ejemplo, ir de “Inicio” a “Perfil”).
- Cliente HTTP (Axios): herramienta para hacer llamadas a APIs (pedir datos al servidor). En el proyecto se encapsula para manejar tokens de seguridad y errores de forma consistente.
- material-ui-confirm: muestra diálogos de confirmación estándar, integrados con MUI.

Documentación oficial:
- MobX: https://mobx.js.org/README.html
- mobx-react-lite: https://mobx.js.org/react-integration.html
- MUI: https://mui.com/
- React Router: https://reactrouter.com/
- Axios: https://axios-http.com/
- material-ui-confirm: https://github.com/jonatanklosko/material-ui-confirm

6) ¿Cómo se organiza el estado (los datos) en este proyecto?
La aplicación usa “Stores” (almacenes) con MobX para guardar y gestionar los datos. Cada Store sabe:
- Qué datos existen (por ejemplo, el token de sesión o la lista de elementos de una tabla).
- Cómo leer datos derivados (por ejemplo, “¿estoy logueado?” depende de si hay token).
- Qué acciones se pueden realizar (por ejemplo, “cerrar sesión” o “actualizar el token”).

Los Stores se comparten con los componentes usando el “Contexto” de React. Así, cualquier componente puede “leer” el Store que necesita sin tener que pasarlo manualmente por todos los niveles.

7) ¿Qué significa que un componente es “observador”?
Con mobx-react-lite, un componente puede observar un Store. Esto significa que si los datos cambian, el componente se actualiza solo. Por ejemplo, si guardas el nombre del usuario en un Store y éste cambia, el encabezado que lo muestra se actualiza automáticamente.

8) ¿Cómo navega la aplicación entre pantallas?
Si el proyecto usa React Router, define rutas (por ejemplo, “/inicio” o “/perfil”) y componentes para cada ruta. Cuando cambias de ruta, React Router muestra el componente correspondiente. Esto permite que la app sea de “una sola página” (Single Page Application) pero con diferentes vistas.

9) ¿Qué es una API y cómo la usa la aplicación?
Una API es una “puerta” que ofrece el servidor para enviar o recibir datos. La app llama a esas “puertas” para, por ejemplo, iniciar sesión, obtener listas o guardar formularios. Normalmente:
- Se necesita un token de seguridad para demostrar quién eres.
- Si el token caduca, se renueva (rotación de token) para seguir usando la app sin pedirte que vuelvas a iniciar sesión inmediatamente.
- Si ocurre un error (por ejemplo, red o permisos), la app muestra mensajes claros y seguros.

Este proyecto centraliza las llamadas a la API con un “cliente” común. Así se aplican automáticamente las reglas de seguridad (añadir el token) y el manejo de errores.

10) Buenas prácticas del proyecto (sin código)
- Separar responsabilidades: los componentes muestran información; los Stores manejan datos y reglas; los hooks reúnen hábitos comunes (por ejemplo, configurar una tabla o consultar usuarios).
- Tipar todo lo que se pueda con TypeScript: ayuda a evitar errores y a entender mejor el código.
- Reutilizar componentes visuales de MUI: ahorra tiempo y mantiene un estilo consistente.
- Evitar duplicar lógica: si una tarea se repite, crear un hook o una función común.
- Mostrar mensajes claros ante errores o confirmaciones: una app amigable es más fácil de usar.

11) ¿Dónde puedo aprender más?
- React (conceptos y tutoriales): https://react.dev/
- Hooks de React: https://react.dev/reference/react
- TypeScript (conceptos básicos y avanzado): https://www.typescriptlang.org/
- MobX (gestión de estado): https://mobx.js.org/README.html
- MUI (componentes de interfaz): https://mui.com/
- React Router (navegación): https://reactrouter.com/
- Axios (llamadas HTTP): https://axios-http.com/

12) Resumen en palabras simples
- React construye la pantalla con piezas llamadas componentes.
- TypeScript pone “etiquetas” a los datos para que el código sea más claro y seguro.
- MobX organiza los datos y avisa a los componentes cuando cambian.
- El Contexto permite compartir datos importantes (como el usuario) con cualquier componente.
- La app llama a APIs del servidor para obtener o guardar información, usando un cliente común con seguridad.
- MUI ofrece componentes visuales listos para usar, así la app luce profesional desde el inicio.

# Uso de React en el proyecto de ALCOM

## 1. Stack de la App y Convenciones

La aplicación usa:
- React + TypeScript
- Estado con MobX y `mobx-react-lite` (decoradores por API funcional: `makeObservable`, `observable`, `computed`, `action`)
- Context API para inyectar Stores
- MUI como librería de componentes UI
- Axios para llamadas a una API

Convenciones clave:
- Componentes funcionales con `React.FC` y tipado de props por `interface`.
- Componentes que leen del Store se envuelven con `observer` de `mobx-react-lite`.
- Un `Context` por Store o módulo. Ejemplos:
  - `src/core/context/ApplicationContext.ts` expone `ApplicationContext` con una instancia de `GeneralApplicationStore`.
  - Módulos definen sus contextos, p. ej. `src/modules/ctr/contrato_cliente/context/ClientContractContext.ts`.

---
## 2. Crear Componentes en el Proyecto

Ejemplo mínimo siguiendo el estilo del proyecto (TypeScript + MUI + observer):

```tsx
// src/modules/example/components/HelloCard.tsx
import { Card, CardContent, Typography } from '@mui/material';
import { FC, useContext } from 'react';
import { observer } from 'mobx-react-lite';
import { ApplicationContext } from '@core/context/ApplicationContext';

interface HelloCardProps {
  title: string;
}

export const HelloCard: FC<HelloCardProps> = observer(({ title }) => {
  const appStore = useContext(ApplicationContext);
  return (
    <Card>
      <CardContent>
        <Typography variant="h6">{title}</Typography>
        <Typography variant="body2">Token actual: {appStore.token}</Typography>
      </CardContent>
    </Card>
  );
});
```

Puntos a notar (consistentes con el código existente como `src/layouts/components/NavBar.tsx` o `src/layouts/MainContainer.tsx`):
- Se usa `FC<Props>` para tipar el componente.
- Se obtiene el store vía `useContext(ApplicationContext)`.
- El componente está envuelto en `observer` para reaccionar a cambios observables.

---
## 3. Stores con MobX: implementación y patrón

El patrón de Store usado en el proyecto está ejemplificado en `src/core/stores/GeneralApplicationStore.ts`:

```ts
import { action, computed, makeObservable, observable, toJS } from 'mobx';

class GeneralApplicationStore {
  private _token: string;

  constructor() {
    this._token = localStorage.getItem('token') ?? '';
    makeObservable(this, {
      _token: observable,
      token: computed,
      setToken: action
    });
  }

  get token(): string {
    return this._token;
  }

  setToken(value: string) {
    this._token = value;
  }
}

export default GeneralApplicationStore;
```

Características clave que verás repetidas en otros stores del proyecto (p. ej., `src/modules/ctr/contrato_cliente/store/*Store.ts` y `src/core/stores/EntityStore.ts`):

- `makeObservable(this, { ... })` para registrar propiedades `observable`, getters `computed` y métodos `action`.
- Encapsulamiento por propiedades privadas (`_token`) y getters/setters públicos tipados.
- Reutilización con una clase base `EntityStore<T>` para entidades de tablas y formularios.

---
## 4. Proveer Stores con Context

Hay dos formas en el repo:

1) Contexto “global” de la app:

```ts
// src/core/context/ApplicationContext.ts
import GeneralApplicationStore from '@core/stores/GeneralApplicationStore';
import { createContext } from 'react';

export const ApplicationContext = createContext(new GeneralApplicationStore());
```

2) Contextos por módulo (p. ej. contratos de cliente):

```ts
// src/modules/ctr/contrato_cliente/context/ClientContractContext.ts
import { createContext } from 'react';
import { ClientContractStore } from '../store/ClientContractStore';

export const ClientContractContext = createContext<ClientContractStore>(new ClientContractStore());
```

Cómo se inyectan en el árbol de componentes: en `src/App.tsx` se ve el patrón con `Provider` y `observer`:

```tsx
// Fragmento de src/App.tsx
const App = observer(function App(props) {
  const appStore = useContext(AppProviderContext); // también se usa ApplicationContext en otros componentes
  return (
    <AppProviderContext.Provider value={appStore}>
      <MainLayout {...props} />
    </AppProviderContext.Provider>
  );
});
```

En módulos específicos, suele bastar con importar el `Context` del módulo y consumirlo en el componente (ver siguientes secciones).

---

## 5. Consumir Stores: `useContext`

El patrón en los componentes es consistente en todo el proyecto (ver `src/layouts/components/NavBar.tsx`, `src/layouts/MainContainer.tsx`, `src/modules/*/*/components/*.tsx`):

```tsx
import { useContext } from 'react';
import { ApplicationContext } from '@core/context/ApplicationContext';

const Component = observer(() => {
  const appStore = useContext(ApplicationContext);

  // Leer valores computados u observables
  const token = appStore.token;

  // Ejecutar acciones
  const onLogout = () => appStore.appLogout();

  return /* JSX */;
});
```

Para contextos de módulo, cambia la importación:

```tsx
import { ClientContractContext } from '@modules/ctr/contrato_cliente/context/ClientContractContext';

const Section = observer(() => {
  const store = useContext(ClientContractContext);
  // usar store.selectedData, store.load(), etc.
  return /* JSX */;
});
```

---

## 6. `observer` en los Componentes

Se utiliza `observer` de `mobx-react-lite` para que el componente re-renderice cuando cambien propiedades observables usadas en el render.

Patrones presentes en el repo (ejemplos reales: `src/layouts/components/SideMenu.tsx`, `src/layouts/components/DefaultTable.tsx`, `src/core/components/datatable/*`):

- Definición con nombre:

```tsx
const MyComp = observer(function MyComp(props: Props) {
  // ...usar stores y props
  return /* JSX */;
});
```

- Arrow function tipada con `FC`:

```tsx
export const NavBar: FC<NavBarProps> = observer(props => {
  // ...
  return /* JSX */;
});
```

Regla práctica:

- Envuelve con `observer` todo componente que consuma valores observables de un Store (directa o indirectamente).

---

## 7. Tipado: `interface` vs `type`

El proyecto usa ambos ampliamente.

Cuándo usar `interface` (común en props de componentes):

- Se puede extender y es ideal para describir “formas” de objetos.
- Ejemplos en el repo:
  - `src/core/components/datatable/GenericTable.tsx` define `interface GenericTableProps { ... }`.
  - `src/layouts/components/DefaultTable.tsx` define múltiples `interface` de props.

Cuándo usar `type` (alias, unions, utilidades genéricas):

- Modelos de datos simples o utilidades: `src/core/types/SiteStatusType.ts`, `src/core/types/GenericsType.ts`, `src/modules/ctr/contrato_cliente/types/ClientContractTypes.ts`.

Ejemplos prácticos:

```ts
// interface para props
interface ProfileViewFormProps {
  readOnly?: boolean;
}

// type para un modelo/alias
export type SiteStatusType = {
  isBlocked: boolean;
  reason: string;
  user: string;
};

// type para utilidades genéricas
export type Values<T> = T[keyof T];
```

Recomendación del proyecto:

- Usa `interface` para props de componentes y firmas de objetos que puedan extenderse.
- Usa `type` para alias de modelos, uniones y utilidades genéricas.

---

## 8. Ejemplo Completo Integrado

```tsx
// src/modules/example/components/UserBadge.tsx
import { Chip } from '@mui/material';
import { FC, useContext } from 'react';
import { observer } from 'mobx-react-lite';
import { ApplicationContext } from '@core/context/ApplicationContext';

interface UserBadgeProps { role: 'admin' | 'user'; }
type LabelColor = 'default' | 'primary' | 'success';

export const UserBadge: FC<UserBadgeProps> = observer(({ role }) => {
  const app = useContext(ApplicationContext);

  const color: LabelColor = role === 'admin' ? 'primary' : 'default';
  const label = app.token ? `Activo (${role})` : 'Invitado';

  return <Chip color={color as any} label={label} />;
});
```

Este ejemplo muestra:

- `interface` para props.
- `type` para alias reutilizable.
- `observer` + `useContext` para reaccionar a cambios del Store global.

---

## 9. Buenas Prácticas y Notas del Proyecto

- Mantén los Stores “finos” y tipados. Evita exponer campos mutables sin acciones.
- Prefiere getters `computed` para valores derivados.
- Usa `toJS` de MobX solo cuando necesites estructuras planas para logs o librerías externas.
- Los componentes de tabla y formularios siguen el patrón de `EntityStore<T>`; respeta ese flujo para CRUD.
- Si un componente no consume observables, no es necesario `observer`.
- Enrutamiento y layout siguen `src/layouts/navigation/Router.tsx` y `src/layouts/MainLayout.tsx`. Mantén Providers de contexto en capas altas (p. ej. `App.tsx`).

---

## 10. Cheatsheet Rápido

- Crear Store:

```ts
class MyStore { /* constructor + makeObservable + getters y actions */ }
export const MyContext = createContext(new MyStore());
```

- Usar Store en componente:

```tsx
const Comp: FC = observer(() => {
  const store = useContext(MyContext);
  return /* JSX */;
});
```

- Props de componente: `interface Props { ... }`
- Modelos/Uniones: `type Model = { ... } | null`

---

## Apéndice A. Hooks de React y su uso en el proyecto

En esta sección se documentan los hooks de React presentes en el proyecto, su propósito, cuándo usarlos, en qué archivos se usan y un patrón de ejemplo. Para más detalle, consulta la documentación oficial: https://react.dev/reference/react

### useState

- Propósito: manejar estado local mutable en componentes.
- Cuándo usar: cuando un valor solo pertenece al componente (inputs, flags, seleccionados temporales).
- Dónde se usa: `src/layouts/MainContainer.tsx`, `src/layouts/components/DefaultTable.tsx`, formularios en `src/modules/**/components/*.tsx`.
- Ejemplo:

```tsx
import { useState } from 'react';

const Toggle = () => {
  const [open, setOpen] = useState(false);
  return <button onClick={() => setOpen(p => !p)}>{open ? 'On' : 'Off'}</button>;
};
```

### useEffect

- Propósito: ejecutar efectos secundarios tras render (fetch, timers, sincronización con APIs externas).
- Cuándo usar: cuando necesitas reaccionar a cambios de props/estado/observables con efectos no-UI.
- Dónde se usa: `src/layouts/MainContainer.tsx` (rotación de token y timers), múltiples componentes en `src/modules/**/components/*.tsx`.
- Ejemplo (sincronización de token):

```tsx
import { useEffect, useContext } from 'react';
import { ApplicationContext } from '@core/context/ApplicationContext';

const TokenRotator = () => {
  const app = useContext(ApplicationContext);
  useEffect(() => {
    const id = setTimeout(() => { void app.appRotateToken(); }, app.expiry_time * 1000 - 3000);
    return () => clearTimeout(id);
  }, [app.expiry_time]);
  return null;
};
```

### useMemo

- Propósito: memoizar valores derivados costosos para evitar recalcularlos en cada render.
- Cuándo usar: listas filtradas/ordenadas, columnas de tablas, cálculos pesados.
- Dónde se usa: componentes de tablas como `src/core/components/datatable/GenericTable.tsx`, selects y autocompletados en `src/core/components/CustomControls/*`.
- Ejemplo:

```tsx
import { useMemo } from 'react';

const Sorted = ({ items }: { items: number[] }) => {
  const sorted = useMemo(() => [...items].sort((a, b) => a - b), [items]);
  return <pre>{JSON.stringify(sorted)}</pre>;
};
```

### useCallback

- Propósito: memoizar funciones para preservar identidad entre renders y optimizar props a hijos/efectos.
- Cuándo usar: cuando pasas callbacks a componentes hijos memoizados o dependes de identidad estable.
- Dónde se usa: tablas y formularios, por ejemplo `src/core/components/datatable/SelectTable.tsx`, `src/modules/facturacion/lotes/components/LotesMain.tsx`.
- Ejemplo:

```tsx
import { useCallback, useState } from 'react';

const List = ({ onSelect }: { onSelect: (id: number) => void }) => /* ... */ null;

const Parent = () => {
  const [sel, setSel] = useState<number | null>(null);
  const handleSelect = useCallback((id: number) => setSel(id), []);
  return <List onSelect={handleSelect} />;
};
```

### useRef

- Propósito: guardar referencias mutables que no causan renders (DOM, timers, cache de valores).
- Cuándo usar: acceso a elementos DOM, mantener IDs de intervalos/timeouts, medir renders previos.
- Dónde se usa: componentes de inputs/tablas como `src/core/components/CustomControls/SelectFromTable.tsx`, `src/core/components/datatable/*`.
- Ejemplo:

```tsx
import { useRef, useEffect } from 'react';

const FocusInput = () => {
  const inputRef = useRef<HTMLInputElement>(null);
  useEffect(() => {
   inputRef.current?.focus();
}, []);
  return <input ref={inputRef} />;
};
```
```
const Componente = () => {

}

export default Componente;

export default function Componente(){

}


```
### useContext

- Propósito: consumir valores inyectados por Context Providers (stores, theming, i18n).
- Cuándo usar: cuando necesitas acceder a un Store o a configuración global.
- Dónde se usa: ampliamente (`src/layouts/components/NavBar.tsx`, `src/layouts/MainContainer.tsx`, módulos `src/modules/**/components/*.tsx`).
- Ejemplo: ver sección 5 de este documento.

### lazy y Suspense

- Propósito: code-splitting de componentes y fallback de carga.
- Cuándo usar: para cargar layouts/módulos bajo demanda.
- Dónde se usa: `src/App.tsx` con `const MainLayout = lazy(() => import('@layouts/MainLayout'));` y `Suspense` con `FallbackLoader`.
- Ejemplo (del proyecto):

```tsx
import { lazy, Suspense } from 'react';
const Page = lazy(() => import('./Page'));

export const App = () => (
  <Suspense fallback={<div>Cargando...</div>}>
    <Page />
  </Suspense>
);
```

### Hooks personalizados del proyecto

Estos hooks encapsulan lógica común y trabajan junto con los Stores/Context:

- useApiCall (`src/core/hooks/useApiCall.ts`)
  - Propósito: centralizar llamadas API, manejar `token`, `siteStatusData`, y errores.
  - Úsalo cuando hagas requests que dependan del `ApplicationContext`.

- useUserInfo (`src/core/hooks/useUserInfo.ts`)
  - Propósito: exponer información del usuario autenticado de forma tipada.
  - Úsalo en componentes que renderizan datos del usuario.

- useTableParams (`src/core/hooks/useTableParams.ts`)
  - Propósito: gestionar paginación, orden y filtros de tablas.
  - Úsalo en componentes `DataGrid`/`Table` para sincronizar parámetros.

- useInterval (`src/core/hooks/useInterval.ts`)
  - Propósito: intervalos declarativos con limpieza automática.
  - Úsalo para tareas repetitivas (p. ej. refrescar datos).

- useThrottleDebounce (`src/core/hooks/useThrottleDebounce.ts`)
  - Propósito: controlar frecuencia de ejecución de funciones (búsquedas, resize).
  - Úsalo para mejorar rendimiento en inputs y scroll.

- useWindowSize (`src/core/hooks/window.ts`)
  - Propósito: exponer `WindowSizeType` reactivo (ancho/alto de la ventana).
  - Úsalo para diseños responsivos y breakpoints personalizados.

