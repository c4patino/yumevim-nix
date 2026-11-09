{
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local fmt = require("luasnip.extras.fmt").fmt

    local js_ts_snippets = {
      -- ===============================================================================
      --   LANGUAGE: Core JavaScript/TypeScript
      -- ===============================================================================

      -- Import
      s("imp", fmt("import {{ {} }} from '{}';", {
        i(1, "function"),
        i(2, "module"),
      })),

      -- Import all
      s("impa", fmt("import * as {} from '{}';", {
        i(1, "name"),
        i(2, "module"),
      })),

      -- Import default
      s("impd", fmt("import {} from '{}';", {
        i(1, "defaultExport"),
        i(2, "module"),
      })),

      -- Import React
      s("impr", fmt("import React from 'react'", {})),

      -- Import React Query
      s("impqr", fmt("import {{ {} }} from '@tanstack/react-query'", {
        i(1, "useQuery"),
      })),

      -- Export default
      s("expt", fmt("export default {}", {
        i(1),
      })),

      -- Export function
      s("expf", fmt([[
        export function {}({}) {{
          {}
        }}
      ]], {
        i(1, "functionName"),
        i(2),
        i(3),
      })),

      -- Export const
      s("expc", fmt("export const {} = {}", {
        i(1, "variableName"),
        i(2),
      })),

      -- Export type
      s("extype", fmt("export type {} = {}", {
        i(1, "TypeName"),
        i(2),
      })),

      -- const
      s("const", fmt("const {} = {}", {
        i(1, "variableName"),
        i(2),
      })),

      -- let
      s("let", fmt("let {} = {}", {
        i(1, "variableName"),
        i(2),
      })),

      -- var
      s("var", fmt("var {} = {}", {
        i(1, "variableName"),
        i(2),
      })),

      -- const assertion
      s("constas", fmt("const {} = {} as const", {
        i(1, "name"),
        i(2),
      })),

      -- if statement
      s("if", fmt([[
        if ({}) {{
          {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
      })),

      -- if/else
      s("ife", fmt([[
        if ({}) {{
          {}
        }} else {{
          {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
        i(3),
      })),

      -- ternary
      s("tern", fmt("{} ? {} : {}", {
        i(1, "condition"),
        i(2),
        i(3),
      })),

      -- switch statement
      s("switch", fmt([[
        switch ({}) {{
          case {}:
            {}
            break;
          case {}:
            {}
            break;
          default:
            {}
        }}
      ]], {
        i(1, "expression"),
        i(2, "value1"),
        i(3),
        i(4, "value2"),
        i(5),
        i(6),
      })),

      -- for loop
      s("for", fmt([[
        for (let {} = 0; {} < {}; {}) {{
          {}
        }}
      ]], {
        i(1, "i"),
        i(2, "i"),
        i(3, "length"),
        i(4, "i++"),
        i(5),
      })),

      -- for...of
      s("forof", fmt([[
        for (const {} of {}) {{
          {}
        }}
      ]], {
        i(1, "item"),
        i(2, "array"),
        i(3),
      })),

      -- for...in
      s("forin", fmt([[
        for (const {} in {}) {{
          {}
        }}
      ]], {
        i(1, "key"),
        i(2, "object"),
        i(3),
      })),

      -- while loop
      s("while", fmt([[
        while ({}) {{
          {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
      })),

      -- do...while
      s("dowh", fmt([[
        do {{
          {}
        }} while ({});
      ]], {
        i(1),
        i(2, "condition"),
      })),

      -- function
      s("fn", fmt([[
        function {}({}) {{
          {}
        }}
      ]], {
        i(1, "functionName"),
        i(2),
        i(3),
      })),

      -- arrow function
      s("arrow", fmt([[
        ({}) => {{
          {}
        }}
      ]], {
        i(1),
        i(2),
      })),

      -- async/await
      s("async", fmt([[
        async function {}({}) {{
          {}
        }}
      ]], {
        i(1, "asyncFunction"),
        i(2),
        i(3),
      })),

      -- generic function
      s("genfn", fmt([[
        function {}<T>(arg: T): T {{
          return arg;
        }}
      ]], {
        i(1, "name"),
      })),

      -- Promise
      s("promise", fmt([[
        new Promise((resolve, reject) => {{
          {}
        }})
      ]], {
        i(1),
      })),

      -- try/catch
      s("try", fmt([[
        try {{
          {}
        }} catch (error) {{
          console.error(error);
        }}
      ]], {
        i(1),
      })),

      -- console.log
      s("cl", fmt("console.log({})", {
        i(1, "value"),
      })),

      -- console.error
      s("cer", fmt("console.error({})", {
        i(1, "value"),
      })),

      -- console.warn
      s("cwar", fmt("console.warn({})", {
        i(1, "value"),
      })),

      -- console.table
      s("ctable", fmt("console.table({})", {
        i(1, "data"),
      })),

      -- console.trace
      s("ctrace", fmt("console.trace({})", {
        i(1, "value"),
      })),

      -- console.group
      s("cgroup", fmt("console.group({})", {
        i(1, "label"),
      })),

      -- console.groupEnd
      s("cgroupend", fmt("console.groupEnd()", {})),

      -- console.clear
      s("cclear", fmt("console.clear()", {})),

      -- forEach
      s("foreach", fmt([[
        {}.forEach(({}) => {{
          {}
        }})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
      })),

      -- map
      s("map", fmt([[
        {}.map(({}) => {{
          {}
        }})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
      })),

      -- filter
      s("filter", fmt([[
        {}.filter(({}) => {{
          {}
        }})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
      })),

      -- find
      s("find", fmt([[
        {}.find(({}) => {{
          {}
        }})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
      })),

      -- reduce
      s("reduce", fmt([[
        {}.reduce(({}, {}) => {{
          return {};
        }}, {})
      ]], {
        i(1, "acc"),
        i(2, "item"),
        i(3),
        i(4),
        i(5),
      })),

      -- some
      s("some", fmt([[
        {}.some(({}) => {{
          return {};
        }}, {})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
        i(4),
      })),

      -- every
      s("every", fmt([[
        {}.every(({}) => {{
          return {};
        }}, {})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
        i(4),
      })),

      -- findIndex
      s("findidx", fmt([[
        {}.findIndex(({}) => {{
          return {};
        }})
      ]], {
        i(1, "array"),
        i(2, "item"),
        i(3),
      })),

      -- setInterval
      s("setint", fmt([[
        setInterval(() => {{
          {}
        }})
      ]], {
        i(1, "callback"),
      })),

      -- setTimeout
      s("settimeout", fmt([[
        setTimeout(() => {{
          {}
        }})
      ]], {
        i(1, "callback"),
      })),

      -- fetch
      s("fetch", fmt([[
        fetch('{}')
          .then(response => response.json())
          .then(data => {{
            {}
          }})
          .catch(error => console.error(error));
      ]], {
        i(1, "url"),
        i(2),
      })),

      -- typeof
      s("typeof", fmt("typeof {}", {
        i(1, "value"),
      })),

      -- instanceof
      s("instanceof", fmt("{} instanceof {}", {
        i(1, "value"),
        i(2, "Constructor"),
      })),

      -- optional chain
      s("opt", fmt("{}.{}", {
        i(1, "object"),
        i(2, "property"),
      })),

      -- nullish coalescing
      s("nullish", fmt("{} ?? {}", {
        i(1, "value"),
        i(2),
      })),

      -- template string
      s("tmpl", fmt("`{}`", {
        i(1),
      })),

      -- document ready
      s("docready", fmt([[
        document.addEventListener('DOMContentLoaded', () => {{
          {}
        }})
      ]], {
        i(1),
      })),

      -- class
      s("class", fmt([[
        class {} {{
          constructor({}) {{
            {}
          }}
        }}
      ]], {
        i(1, "ClassName"),
        i(2),
        i(3),
      })),

      -- constructor
      s("ctor", fmt([[
        constructor({}) {{
          {}
        }}
      ]], {
        i(1),
        i(2),
      })),

      -- private property
      s("priv", fmt("private {}:", {
        i(1, "property"),
      })),

      -- public property
      s("pub", fmt("public {}:", {
        i(1, "property"),
      })),

      -- protected property
      s("prot", fmt("protected {}:", {
        i(1, "property"),
      })),

      -- static property
      s("stat", fmt("static {}:", {
        i(1, "property"),
      })),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- interface
      s("interface", fmt("interface {} {{\n  \n}}", {
        i(1, "InterfaceName"),
      })),

      -- type alias
      s("type", fmt("type {} = {}", {
        i(1, "TypeName"),
        i(2),
      })),

      -- intersection type
      s("intersect", fmt("type {} = {} & {}", {
        i(1, "TypeName"),
        i(2),
        i(3),
      })),

      -- union type
      s("union", fmt("type {} = {} | {}", {
        i(1, "TypeName"),
        i(2),
        i(3),
      })),

      -- enum
      s("enum", fmt([[
        enum {} {{
          {},
        }}
      ]], {
        i(1, "EnumName"),
        i(2, "VALUE"),
      })),

      -- type assertion (ts)
      s("cast", fmt("{} as {}", {
        i(1),
        i(2),
      })),

      -- non-null assertion
      s("nonnull", fmt("{}!", {
        i(1),
      })),

      -- Record type
      s("record", fmt("type {} = Record<{}, {}>", {
        i(1, "TypeName"),
        i(2, "string"),
        i(3),
      })),

      -- Pick type
      s("pick", fmt("Pick<{}, {}>", {
        i(1),
        i(2, "key1 | key2"),
      })),

      -- Omit type
      s("omit", fmt("Omit<{}, {}>", {
        i(1),
        i(2, "key1 | key2"),
      })),

      -- Extract type
      s("extract", fmt("Extract<{}, {}>", {
        i(1),
        i(2),
      })),

      -- Exclude type
      s("exclude", fmt("Exclude<{}, {}>", {
        i(1),
        i(2),
      })),

      -- utility: Required
      s("required", fmt("Required<{}>", {
        i(1),
      })),

      -- utility: Partial
      s("partial", fmt("Partial<{}>", {
        i(1),
      })),

      -- utility: Readonly
      s("readonly", fmt("Readonly<{}>", {
        i(1),
      })),

      -- utility: NonNullable
      s("nonnullable", fmt("NonNullable<{}>", {
        i(1),
      })),

      -- utility: Nullable
      s("nullable", fmt("Nullable<{}>", {
        i(1),
      })),

      -- utility: Parameters
      s("params", fmt("Parameters<{}>", {
        i(1),
      })),

      -- utility: ReturnType
      s("returntype", fmt("ReturnType<{}>", {
        i(1),
      })),

      -- utility: OmitThisParameter
      s("omithis", fmt("OmitThisParameter<{}>", {
        i(1),
      })),

      -- utility: ThisParameterType
      s("thisparam", fmt("ThisParameterType<{}>", {
        i(1),
      })),

      -- utility: ThisType
      s("thistype", fmt("ThisType<{}>", {
        i(1),
      })),

      -- mapped type
      s("mapped", fmt([[
        type {}<T> = {{
          [P in keyof T]: {};
        }}
      ]], {
        i(1, "TypeName"),
        i(2),
      })),

      -- namespace
      s("ns", fmt([[
        namespace {} {{
          {}
        }}
      ]], {
        i(1, "Namespace"),
        i(2),
      })),

      -- module
      s("module", fmt([[
        module {} {{
          {}
        }}
      ]], {
        i(1, "Module"),
        i(2),
      })),

      -- namespace with module
      s("nsmod", fmt([[
        export namespace {} {{
          export function {}({}): {} {{
            return {};
          }}
        }}
      ]], {
        i(1, "Namespace"),
        i(2, "functionName"),
        i(3),
        i(4),
        i(5),
      })),

      -- module export assignment
      s("export", fmt("export = {}", {
        i(1),
      })),

      -- namespace export
      s("nsexport", fmt([[
        export namespace {} {{
          export const {} = {};
        }}
      ]], {
        i(1, "Namespace"),
        i(2, "name"),
        i(3),
      })),

      -- decorator
      s("decorator", fmt([[
        function {}(target: any, propertyKey: string) {{
          {}
        }}
      ]], {
        i(1, "decoratorName"),
        i(2),
      })),

      -- decorator factory
      s("decofact", fmt([[
        function {}(param: {}): MethodDecorator {{
          return (target: any, propertyKey: string, descriptor: PropertyDescriptor) => {{
            {}
          }}
        }}
      ]], {
        i(1, "decoratorName"),
        i(2),
        i(3),
      })),

      -- generic class
      s("genclass", fmt([[
        class {}<T> {{
          private value: T;

          constructor(value: T) {{
            this.value = value;
          }}

          get(): T {{
            return this.value;
          }}
        }}
      ]], {
        i(1, "ClassName"),
      })),

      -- module augmentation
      s("modaug", fmt([[
        declare module '{}' {{
          interface {} {{
            {}
          }}
        }}
      ]], {
        i(1, "module"),
        i(2),
        i(3),
      })),

      -- ===============================================================================
      --   LIBRARIES: React
      -- ===============================================================================

      -- React component (function declaration)
      s("rcomp", fmt([[
        import React from 'react';

        interface {}Props {{}}

        function {}({}: {}Props) {{
          return (
            <div>
              {}
            </div>
          );
        }}
      ]], {
        i(1, "MyComponent"),
        i(2, "MyComponent"),
        i(3),
        i(4, "MyComponent"),
        i(5),
      })),

      -- React functional component (alias)
      s("rfc", fmt([[
        import React from 'react';

        interface {}Props {{}}

        function {}({}: {}Props) {{
          return (
            <div>
              {}
            </div>
          );
        }}
      ]], {
        i(1, "MyComponent"),
        i(2, "MyComponent"),
        i(3),
        i(4, "MyComponent"),
        i(5),
      })),

      -- React hook (function declaration)
      s("rch", fmt([[
        export function use{}() {{
          const {} = useState<{}>({})
          return {{
            {},
            set{}
          }}
        }}
      ]], {
        i(1, "MyHook"),
        i(2, "state"),
        i(3),
        i(4),
        i(5, "state"),
        i(6, "State"),
      })),

      -- React useEffect
      s("useeffect", fmt([[
        useEffect(() => {{
          {}
        }}, [{}])
      ]], {
        i(1),
        i(2),
      })),

      -- React useState
      s("usestate", fmt("const [{}, set{}] = useState({})", {
        i(1, "state"),
        i(2, "State"),
        i(3),
      })),

      -- React useState with type
      s("usestatet", fmt("const [{}, set{}] = useState<{}>({})", {
        i(1, "state"),
        i(2, "State"),
        i(3),
        i(4),
      })),

      -- React useMemo
      s("usememo", fmt([[
        const {} = useMemo(() => {{
          {}
        }}, [{}])
      ]], {
        i(1, "memoizedValue"),
        i(2),
        i(3),
      })),

      -- React useCallback
      s("usecallback", fmt([[
        const {} = useCallback(({}) => {{
          {}
        }}, [{}])
      ]], {
        i(1, "callback"),
        i(2),
        i(3),
        i(4),
      })),

      -- React useRef
      s("useref", fmt("const {} = useRef<{}>({})", {
        i(1, "ref"),
        i(2),
        i(3),
      })),

      -- React useReducer
      s("usereducer", fmt("const [{}, dispatch] = useReducer({}, {})", {
        i(1, "state"),
        i(2),
        i(3),
      })),

      -- React useContext
      s("usectx", fmt("const {} = useContext({})", {
        i(1, "context"),
        i(2),
      })),

      -- React useLayoutEffect
      s("uselayout", fmt([[
        useLayoutEffect(() => {{
          {}
        }}, [{}])
      ]], {
        i(1),
        i(2),
      })),

      -- React useDebugValue
      s("usedebug", fmt("useDebugValue({})", {
        i(1, "value"),
      })),

      -- ===============================================================================
      --   LIBRARIES: React Query (@tanstack/react-query)
      -- ===============================================================================

      -- React Query: useQuery
      s("usequery", fmt([[
        const {} = useQuery({{
          queryKey: [{}],
          queryFn: async () => {{
            const response = await fetch('{}');
            return response.json();
          }}
        }})
      ]], {
        i(1, "data"),
        i(2, "key"),
        i(3, "url"),
      })),

      -- React Query: useMutation
      s("usemutation", fmt([[
        const mutation = useMutation({{
          mutationFn: async (variables) => {{
            const response = await fetch('{}', {{}});
            return response.json();
          }},
          onSuccess: () => {{
            {}
          }}
        }})
      ]], {
        i(1, "url"),
        i(2),
      })),

      -- React Query: useQueryClient
      s("usequeryclient", fmt("const queryClient = useQueryClient()", {})),

      -- React Query: useInfiniteQuery
      s("useinfinitequery", fmt([[
        const {} = useInfiniteQuery({{
          queryKey: [{}],
          queryFn: async ({{ pageParam = 1 }}) => {{
            const response = await fetch('{}?page=' + pageParam);
            return response.json();
          }},
          getNextPageParam: (lastPage, allPages) => {{
            return lastPage.nextCursor || null;
          }}
        }})
      ]], {
        i(1, "data"),
        i(2, "key"),
        i(3, "url"),
      })),

      -- React Query: useQueryError
      s("usequeryerror", fmt("const {} = useQueryError()", {
        i(1, "error"),
      })),

      -- React Query: useIsFetching
      s("useisfetching", fmt("const isFetching = useIsFetching()", {})),

      -- React Query: useIsMutating
      s("useismutating", fmt("const isMutating = useIsMutating()", {})),

      -- React Query: useQueries
      s("usequeries", fmt([[
        const results = useQueries({{
          queries: [
            {{
              queryKey: [{}],
              queryFn: {}
            }},
            {{
              queryKey: [{}],
              queryFn: {}
            }}
          ]
        }})
      ]], {
        i(1, "key1"),
        i(2, "queryFn1"),
        i(3, "key2"),
        i(4, "queryFn2"),
      })),

      -- React Query: prefetchQuery
      s("prefetchquery", fmt([[
        await queryClient.prefetchQuery({{
          queryKey: [{}],
          queryFn: async () => {{
            const response = await fetch('{}');
            return response.json();
          }}
        }})
      ]], {
        i(1, "key"),
        i(2, "url"),
      })),

      -- React Query: invalidateQueries
      s("invalidatequery", fmt([[
        await queryClient.invalidateQueries({{ queryKey: [{}] }})
      ]], {
        i(1, "key"),
      })),

      -- React Query: setQueryData
      s("setquerydata", fmt([[
        queryClient.setQueryData([{}], {})
      ]], {
        i(1, "key"),
        i(2),
      })),

      -- React Query: getQueryData
      s("getquerydata", fmt("const data = queryClient.getQueryData([{}])", {
        i(1, "key"),
      })),

      -- React Query: useSyncExternalStore
      s("usesyncext", fmt([[
        const {} = useSyncExternalStore(subscribe, getSnapshot, getSnapshot)
      ]], {
        i(1, "snapshot"),
      })),

      -- ===============================================================================
      --   LIBRARIES: axios
      -- ===============================================================================

      -- axios: get
      s("axget", fmt([[
        axios.get('{}')
          .then(response => {{
            {}
          }})
          .catch(error => console.error(error));
      ]], {
        i(1, "url"),
        i(2),
      })),

      -- axios: post
      s("axpost", fmt([[
        axios.post('{}', {})
          .then(response => {{
            {}
          }})
          .catch(error => console.error(error));
      ]], {
        i(1, "url"),
        i(2, "data"),
        i(3),
      })),

      -- axios: put
      s("axput", fmt([[
        axios.put('{}', {})
          .then(response => {{
            {}
          }})
          .catch(error => console.error(error));
      ]], {
        i(1, "url"),
        i(2, "data"),
        i(3),
      })),

      -- axios: delete
      s("axdelete", fmt([[
        axios.delete('{}')
          .then(response => {{
            {}
          }})
          .catch(error => console.error(error));
      ]], {
        i(1, "url"),
        i(2),
      })),
    }

    ls.add_snippets("javascript", js_ts_snippets)
    ls.add_snippets("typescript", js_ts_snippets)
    ls.add_snippets("javascriptreact", js_ts_snippets)
    ls.add_snippets("typescriptreact", js_ts_snippets)
  '';
}
