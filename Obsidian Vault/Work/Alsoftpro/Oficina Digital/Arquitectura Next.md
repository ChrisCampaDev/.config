# OD Front Next - Documentación de la Aplicación Frontend

## Resumen

Este proyecto es una aplicación frontend moderna construida con Next.js, diseñada para proporcionar una interfaz de usuario robusta y escalable. La aplicación integra múltiples tecnologías para manejar el manejo de estado, autenticación, comunicación con API y componentes de UI.

## Tecnológias
### Framework Principal
- **Next.js 15.5.4**: Framework basado en React para renderizado del lado del servidor, generación de sitios estáticos y rutas API
- **React 19.1.0**: Biblioteca de UI para construir interfaces de usuario interactivas
- **TypeScript**: JavaScript con tipos para una mejor experiencia de desarrollo
### Manejo de Estado
- **Zustand**: Biblioteca ligera de manejo de estado para aplicaciones React
### Autenticación
- **Auth.js (NextAuth.js)**: Solución completa de autenticación de código abierto para aplicaciones Next.js
### Integración de API
- **Django REST API**: API backend construida con Django para manejo de datos y lógica de negocio
- ### Componentes de UI y Estilos
- **Shadcn UI**: Componentes de UI modernos construidos sobre Radix UI y Tailwind CSS
- **Tailwind CSS 4**: Framework CSS utility-first para desarrollo rápido de UI
### Herramientas de Desarrollo
- **Biome**: Linter y formateador rápido para JavaScript/TypeScript
- **Turbopack**: Empaquetador de alto rendimiento para desarrollo Next.js
## Estructura del Proyecto

```
od_front_next/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── layout.tsx         # Layout raíz
│   │   ├── page.tsx           # Página principal
│   │   └── blog/              # Sección del blog
│   │       ├── layout.tsx     # Layout del blog
│   │       └── page.tsx       # Página de listado del blog
│   └── components/            # Componentes de UI reutilizables
├── styles/
│   └── globals.css            # Estilos globales
├── public/                    # Activos estáticos
└── package.json               # Dependencias y scripts
```
### Estructura Dinamica

```
app/
 └── contactos/
      ├── page.tsx
      └── @modal/
           ├── default.tsx
           ├── (.)nuevo/
           │    └── page.tsx
           ├── (.)[id]/
           │    └── editar/
           │         └── page.tsx
           └── (.)[id]/
                └── eliminar/
                     └── page.tsx

```

## Instalación y Configuración

1. **Clonar el repositorio**

   ```bash
   git clone <url-del-repositorio>
   cd od_front_next
   ```

2. **Instalar dependencias**

   ```bash
   npm install
   ```

3. **Configuración del Entorno**
   Crear un archivo `.env.local` con las siguientes variables:

   ```env
   NEXTAUTH_URL=http://localhost:3000
   NEXTAUTH_SECRET=tu-clave-secreta
   DJANGO_API_URL=http://localhost:8000/api
   ```

4. **Ejecutar servidor de desarrollo**

   ```bash
   npm run dev
   ```

5. **Abrir navegador**
   Navegar a [http://localhost:3000](http://localhost:3000)

## Arquitectura de Next.js

### App Router

Este proyecto utiliza el App Router de Next.js 15, que proporciona:

- **Componentes del Servidor**: Componentes que se ejecutan en el servidor para mejor rendimiento
- **Componentes del Cliente**: Componentes interactivos que se ejecutan en el navegador
- **Layouts Anidados**: UI compartida entre páginas
- **Estados de Carga**: UI de carga automática para operaciones asíncronas
- **Límites de Error**: Manejo de errores elegante

### Convención de Estructura de Archivos

- `layout.tsx`: Define UI compartida para un segmento de ruta
- `page.tsx`: Componente de página para una ruta
- `loading.tsx`: UI de carga para operaciones asíncronas
- `error.tsx`: UI de error para límites de error
- `not-found.tsx`: Página 404

Ejemplo de estructura de layout:

```tsx
// src/app/layout.tsx
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="es">
      <body>
        <header>Navegación</header>
        {children}
        <footer>Pie de página</footer>
      </body>
    </html>
  );
}
```

### Enrutamiento Dinámico

Next.js soporta rutas dinámicas usando corchetes. Por ejemplo, para mostrar un post específico del blog:

```tsx
// src/app/blog/[id]/page.tsx
import { notFound } from "next/navigation";

interface PostPageProps {
  params: {
    id: string;
  };
}

export default async function PostPage({ params }: PostPageProps) {
  // Simular fetching de datos
  const post = await fetchPostById(params.id);

  if (!post) {
    notFound();
  }

  return (
    <article>
      <h1>{post.title}</h1>
      <p>{post.content}</p>
      <p>Publicado el: {post.date}</p>
    </article>
  );
}

// Función para generar rutas estáticas (opcional)
export async function generateStaticParams() {
  const posts = await fetchAllPosts();

  return posts.map((post) => ({
    id: post.id.toString(),
  }));
}
```

Para rutas más complejas con múltiples parámetros:

```tsx
// src/app/blog/[slug]/comments/[commentId]/page.tsx
interface CommentPageProps {
  params: {
    slug: string;
    commentId: string;
  };
}

export default function CommentPage({ params }: CommentPageProps) {
  return (
    <div>
      <h1>Comentario {params.commentId}</h1>
      <p>Del post: {params.slug}</p>
    </div>
  );
}
```

## Manejo de Estado con Zustand

Zustand es una solución ligera, rápida y escalable de manejo de estado para aplicaciones React.

### Instalación

```bash
npm install zustand
```

### Creación Básica de Store

```typescript
// src/store/userStore.ts
import { create } from "zustand";

interface UserState {
  user: User | null;
  isAuthenticated: boolean;
  login: (user: User) => void;
  logout: () => void;
}

export const useUserStore = create<UserState>((set) => ({
  user: null,
  isAuthenticated: false,
  login: (user) => set({ user, isAuthenticated: true }),
  logout: () => set({ user: null, isAuthenticated: false }),
}));
```

### Uso en Componentes

```tsx
// src/components/UserProfile.tsx
import { useUserStore } from "@/store/userStore";

export function UserProfile() {
  const { user, isAuthenticated, logout } = useUserStore();

  if (!isAuthenticated) {
    return <div>Por favor inicia sesión</div>;
  }

  return (
    <div>
      <h2>Bienvenido, {user?.name}</h2>
      <button onClick={logout}>Cerrar Sesión</button>
    </div>
  );
}
```

### Acciones Asíncronas

```typescript
// src/store/apiStore.ts
import { create } from "zustand";

interface ApiState {
  data: any[];
  loading: boolean;
  error: string | null;
  fetchData: () => Promise<void>;
}

export const useApiStore = create<ApiState>((set) => ({
  data: [],
  loading: false,
  error: null,
  fetchData: async () => {
    set({ loading: true, error: null });
    try {
      const response = await fetch("/api/data");
      const data = await response.json();
      set({ data, loading: false });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },
}));
```

## Autenticación con Auth.js

Auth.js (anteriormente NextAuth.js) proporciona una solución completa de autenticación.

### Instalación

```bash
npm install next-auth
```

### Configuración

```typescript
// src/lib/auth.ts
import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

export const { handlers, auth, signIn, signOut } = NextAuth({
  providers: [
    CredentialsProvider({
      name: "credentials",
      credentials: {
        email: { label: "Email", type: "email" },
        password: { label: "Contraseña", type: "password" },
      },
      async authorize(credentials) {
        // Llamar a tu API de Django para autenticación
        const response = await fetch(
          `${process.env.DJANGO_API_URL}/auth/login`,
          {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(credentials),
          }
        );

        if (response.ok) {
          const user = await response.json();
          return user;
        }
        return null;
      },
    }),
  ],
  pages: {
    signIn: "/auth/iniciar-sesion",
    signUp: "/auth/registrarse",
  },
});
```

### Ruta API

```typescript
// src/app/api/auth/[...nextauth]/route.ts
import { handlers } from "@/lib/auth";

export const { GET, POST } = handlers;
```

### Uso en el Cliente

```tsx
// src/components/AuthButton.tsx
"use client";

import { signIn, signOut, useSession } from "next-auth/react";

export function AuthButton() {
  const { data: session } = useSession();

  if (session) {
    return (
      <div>
        <p>Bienvenido, {session.user?.name}</p>
        <button onClick={() => signOut()}>Cerrar Sesión</button>
      </div>
    );
  }

  return <button onClick={() => signIn()}>Iniciar Sesión</button>;
}
```

### Rutas Protegidas

```tsx
// src/components/ProtectedRoute.tsx
"use client";

import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

export function ProtectedRoute({ children }: { children: React.ReactNode }) {
  const { data: session, status } = useSession();
  const router = useRouter();

  useEffect(() => {
    if (status === "loading") return; // Aún cargando
    if (!session) router.push("/auth/iniciar-sesion");
  }, [session, status, router]);

  if (status === "loading") {
    return <div>Cargando...</div>;
  }

  return <>{children}</>;
}
```

## Integración de API con Django REST API

### Obtención de Datos

```typescript
// src/lib/api.ts
const API_BASE_URL = process.env.NEXT_PUBLIC_DJANGO_API_URL;

export async function fetchPosts() {
  const response = await fetch(`${API_BASE_URL}/posts/`);
  if (!response.ok) {
    throw new Error("Error al obtener posts");
  }
  return response.json();
}

export async function createPost(data: { title: string; content: string }) {
  const response = await fetch(`${API_BASE_URL}/posts/`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      // Incluir token de auth si está disponible
      Authorization: `Bearer ${token}`,
    },
    body: JSON.stringify(data),
  });

  if (!response.ok) {
    throw new Error("Error al crear post");
  }
  return response.json();
}
```

### Uso con Zustand

```typescript
// src/store/postStore.ts
import { create } from "zustand";
import { fetchPosts, createPost } from "@/lib/api";

interface PostState {
  posts: Post[];
  loading: boolean;
  error: string | null;
  loadPosts: () => Promise<void>;
  addPost: (post: Omit<Post, "id">) => Promise<void>;
}

export const usePostStore = create<PostState>((set, get) => ({
  posts: [],
  loading: false,
  error: null,

  loadPosts: async () => {
    set({ loading: true, error: null });
    try {
      const posts = await fetchPosts();
      set({ posts, loading: false });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },

  addPost: async (postData) => {
    set({ loading: true, error: null });
    try {
      const newPost = await createPost(postData);
      set((state) => ({
        posts: [...state.posts, newPost],
        loading: false,
      }));
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },
}));
```

### Componentes del Servidor con API

```typescript
// src/app/blog/page.tsx
import { fetchPosts } from "@/lib/api";

export default async function BlogPage() {
  const posts = await fetchPosts();

  return (
    <div>
      <h1>Posts del Blog</h1>
      {posts.map((post) => (
        <article key={post.id}>
          <h2>{post.title}</h2>
          <p>{post.content}</p>
        </article>
      ))}
    </div>
  );
}
```

## Componentes de UI con Shadcn UI y Tailwind CSS

### Instalación

```bash
npx shadcn@latest init
npx shadcn@latest add button card input
```

### Uso de Componentes

```tsx
// src/components/PostCard.tsx
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

interface PostCardProps {
  title: string;
  content: string;
  onReadMore: () => void;
}

export function PostCard({ title, content, onReadMore }: PostCardProps) {
  return (
    <Card className="w-full max-w-md">
      <CardHeader>
        <CardTitle>{title}</CardTitle>
      </CardHeader>
      <CardContent>
        <p className="text-gray-600 mb-4">{content}</p>
        <Button onClick={onReadMore} variant="outline">
          Leer Más
        </Button>
      </CardContent>
    </Card>
  );
}
```

### Estilos Personalizados con Tailwind

```tsx
// src/components/Hero.tsx
export function Hero() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100 px-4">
      <div className="text-center max-w-2xl">
        <h1 className="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
          Bienvenido a Nuestro Sitio
        </h1>
        <p className="text-lg md:text-xl text-gray-600 mb-8">
          Descubre contenido increíble y mantente actualizado con nuestras
          últimas publicaciones.
        </p>
        <Button className="bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 px-6 rounded-lg transition duration-300 ease-in-out transform hover:scale-105">
          Explorar Blog
        </Button>
      </div>
    </div>
  );
}
```

## Middleware de Next.js

El middleware en Next.js permite ejecutar código antes de que se complete una solicitud. Es útil para autenticación, redirecciones, reescrituras y más.

### Middleware Básico

```typescript
// src/middleware.ts
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  // Clonar la respuesta
  const response = NextResponse.next();

  // Agregar headers personalizados
  response.headers.set("x-custom-header", "custom-value");

  return response;
}

export const config = {
  matcher: "/api/:path*",
};
```

### Middleware de Autenticación

```typescript
// src/middleware.ts
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { auth } from "@/lib/auth";

export async function middleware(request: NextRequest) {
  const session = await auth();

  // Proteger rutas de admin
  if (request.nextUrl.pathname.startsWith("/admin") && !session) {
    return NextResponse.redirect(new URL("/auth/iniciar-sesion", request.url));
  }

  // Redirigir usuarios autenticados lejos de páginas de auth
  if (request.nextUrl.pathname.startsWith("/auth") && session) {
    return NextResponse.redirect(new URL("/dashboard", request.url));
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/admin/:path*", "/auth/:path*", "/dashboard/:path*"],
};
```

### Middleware de Internacionalización

```typescript
// src/middleware.ts
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

const locales = ["en", "es", "fr"];
const defaultLocale = "es";

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;

  // Verificar si el pathname ya incluye un locale
  const pathnameHasLocale = locales.some(
    (locale) => pathname.startsWith(`/${locale}/`) || pathname === `/${locale}`
  );

  if (pathnameHasLocale) return NextResponse.next();

  // Redirigir al locale por defecto
  const locale = request.cookies.get("NEXT_LOCALE")?.value || defaultLocale;
  request.nextUrl.pathname = `/${locale}${pathname}`;

  return NextResponse.redirect(request.nextUrl);
}

export const config = {
  matcher: [
    // Omitir todas las rutas internas (_next)
    "/((?!_next).*)",
    // Opcional: solo ejecutar en URL raíz (/)
    // '/'
  ],
};
```

### Middleware de Limitación de Tasa

```typescript
// src/middleware.ts
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

const rateLimitMap = new Map<string, { count: number; resetTime: number }>();

export function middleware(request: NextRequest) {
  const ip = request.ip || "anonymous";
  const now = Date.now();
  const windowMs = 15 * 60 * 1000; // 15 minutos
  const maxRequests = 100;

  const userRequests = rateLimitMap.get(ip) || {
    count: 0,
    resetTime: now + windowMs,
  };

  if (now > userRequests.resetTime) {
    userRequests.count = 1;
    userRequests.resetTime = now + windowMs;
  } else {
    userRequests.count++;
  }

  rateLimitMap.set(ip, userRequests);

  if (userRequests.count > maxRequests) {
    return NextResponse.json(
      { error: "Demasiadas solicitudes" },
      { status: 429 }
    );
  }

  return NextResponse.next();
}

export const config = {
  matcher: "/api/:path*",
};
```

## Flujo de Desarrollo

### Scripts Disponibles

- `npm run dev`: Iniciar servidor de desarrollo con Turbopack
- `npm run build`: Construir bundle de producción
- `npm run start`: Iniciar servidor de producción
- `npm run lint`: Ejecutar linter de Biome
- `npm run format`: Formatear código con Biome

### Calidad del Código

- **TypeScript**: Verificación estricta de tipos habilitada
- **Biome**: Linting y formateo rápido
- **ESLint**: Integrado con Next.js para calidad del código

### Mejores Prácticas

1. Usar TypeScript para todo el código nuevo
2. Seguir mejores prácticas de React y hooks
3. Usar componentes de Shadcn UI para consistencia
4. Implementar manejo de errores apropiado
5. Escribir pruebas comprehensivas (cuando se agregue framework de pruebas)
6. Usar variables de entorno para configuración
7. Implementar flujos de autenticación apropiados
8. Optimizar imágenes y activos

## Despliegue

### Vercel (Recomendado)

1. Conectar tu repositorio a Vercel
2. Configurar variables de entorno
3. Desplegar automáticamente al hacer push

### Otras Plataformas

La aplicación puede desplegarse en cualquier plataforma que soporte Node.js:

- Netlify
- Railway
- DigitalOcean App Platform
- AWS Amplify

## Contribuyendo

1. Hacer fork del repositorio
2. Crear una rama de feature
3. Hacer tus cambios
4. Ejecutar pruebas y linting
5. Enviar un pull request

## Licencia

Este proyecto está licenciado bajo la Licencia MIT.
