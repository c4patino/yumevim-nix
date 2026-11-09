{
  # LaTeX snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local latex_snippets = {
      -- Sections
      s("sec", fmt("\\section{{{}}}", {
        i(1, "Section Title")
      })),

      s("ssec", fmt("\\subsection{{{}}}", {
        i(1, "Subsection Title")
      })),

      s("sssec", fmt("\\subsubsection{{{}}}", {
        i(1, "Subsubsection Title")
      })),

      s("para", fmt("\\paragraph{{{}}} {}", {
        i(1, "Paragraph Title"),
        i(2)
      })),

      -- Text formatting
      s("bf", fmt("\\textbf{{{}}}", { i(1, "text") })),
      s("it", fmt("\\textit{{{}}}", { i(1, "text") })),
      s("em", fmt("\\emph{{{}}}", { i(1, "text") })),
      s("tt", fmt("\\texttt{{{}}}", { i(1, "text") })),
      s("underline", fmt("\\underline{{{}}}", { i(1, "text") })),

      -- Math environments
      s("math", fmt("\\[{}\n\\]", {
        i(1, "expression")
      })),

      s("inline", fmt("\\({}\\)", {
        i(1, "expression")
      })),

      s("equation", fmt([[
        \begin{{equation}}
            {}
        \end{{equation}}]], {
        i(1, "expression")
      })),

      s("align", fmt([[
        \begin{{align}}
            {} &= {} \\
            {} &= {}
        \end{{align}}]], {
        i(1, "left"),
        i(2, "right"),
        i(3, "left"),
        i(4, "right")
      })),

      s("align*", fmt([[
        \begin{{align*}}
            {} &= {} \\
            {} &= {}
        \end{{align*}}]], {
        i(1, "left"),
        i(2, "right"),
        i(3, "left"),
        i(4, "right")
      })),

      s("frac", fmt("\\frac{{{}}}{{{}}}", {
        i(1, "numerator"),
        i(2, "denominator")
      })),

      s("sqrt", fmt("\\sqrt{{{}}}", {
        i(1, "expression")
      })),

      s("sum", fmt("\\sum_{{{}}}^{{{}}} {}", {
        i(1, "i=1"),
        i(2, "n"),
        i(3, "expression")
      })),

      s("int", fmt("\\int_{{{}}}^{{{}}} {} \\, d{}", {
        i(1, "a"),
        i(2, "b"),
        i(3, "f(x)"),
        i(4, "x")
      })),

      s("lim", fmt("\\lim_{{{} \\to {}}} {}", {
        i(1, "x"),
        i(2, "0"),
        i(3, "expression")
      })),

      -- Greek letters
      s("alpha", t("\\alpha")),
      s("beta", t("\\beta")),
      s("gamma", t("\\gamma")),
      s("delta", t("\\delta")),
      s("epsilon", t("\\epsilon")),
      s("theta", t("\\theta")),
      s("lambda", t("\\lambda")),
      s("mu", t("\\mu")),
      s("sigma", t("\\sigma")),
      s("omega", t("\\omega")),
      s("pi", t("\\pi")),

      -- Common math symbols
      s("infty", t("\\infty")),
      s("neq", t("\\neq")),
      s("leq", t("\\leq")),
      s("geq", t("\\geq")),
      s("approx", t("\\approx")),
      s("times", t("\\times")),
      s("cdot", t("\\cdot")),
      s("pm", t("\\pm")),
      s("rightarrow", t("\\rightarrow")),
      s("Rightarrow", t("\\Rightarrow")),
      s("forall", t("\\forall")),
      s("exists", t("\\exists")),
      s("subset", t("\\subseteq")),
      s("in", t("\\in")),
      s("notin", t("\\notin")),

      -- Matrices
      s("matrix", fmt([[
        \begin{{bmatrix}}
            {} & {} \\
            {} & {}
        \end{{bmatrix}}]], {
        i(1, "a"),
        i(2, "b"),
        i(3, "c"),
        i(4, "d")
      })),

      s("pmatrix", fmt([[
        \begin{{pmatrix}}
            {} & {} \\
            {} & {}
        \end{{pmatrix}}]], {
        i(1, "a"),
        i(2, "b"),
        i(3, "c"),
        i(4, "d")
      })),

      -- Lists
      s("itemize", fmt([[
        \begin{{itemize}}
            \item {}
            \item {}
        \end{{itemize}}]], {
        i(1, "First item"),
        i(2, "Second item")
      })),

      s("enumerate", fmt([[
        \begin{{enumerate}}
            \item {}
            \item {}
        \end{{enumerate}}]], {
        i(1, "First item"),
        i(2, "Second item")
      })),

      -- Figures
      s("figure", fmt([[
        \begin{{figure}}[{}]
            \centering
            \includegraphics[width={}\textwidth]{{{}}}
            \caption{{{}}}
            \label{{fig:{}}}
        \end{{figure}}]], {
        i(1, "htbp"),
        i(2, "0.8"),
        i(3, "image.png"),
        i(4, "Figure caption"),
        i(5, "figure-name")
      })),

      -- Tables
      s("table", fmt([[
        \begin{{table}}[{}]
            \centering
            \caption{{{}}}
            \label{{tab:{}}}
            \begin{{tabular}}{{{}}}
                \hline
                {} & {} \\
                \hline
                {} & {} \\
                \hline
            \end{{tabular}}
        \end{{table}}]], {
        i(1, "htbp"),
        i(2, "Table caption"),
        i(3, "table-name"),
        i(4, "cc"),
        i(5, "Column 1"),
        i(6, "Column 2"),
        i(7, "Value 1"),
        i(8, "Value 2")
      })),

      -- References
      s("label", fmt("\\label{{{}}}", {
        i(1, "section:name")
      })),

      s("ref", fmt("\\ref{{{}}}", {
        i(1, "label")
      })),

      s("eqref", fmt("\\eqref{{{}}}", {
        i(1, "eq:label")
      })),

      s("cite", fmt("\\cite{{{}}}", {
        i(1, "reference")
      })),

      s("citep", fmt("\\citep{{{}}}", {
        i(1, "reference")
      })),

      s("citet", fmt("\\citet{{{}}}", {
        i(1, "reference")
      })),

      -- Theorem environments
      s("theorem", fmt([[
        \begin{{theorem}}
            {}
        \end{{theorem}}]], {
        i(1, "Theorem statement")
      })),

      s("proof", fmt([[
        \begin{{proof}}
            {}
        \end{{proof}}]], {
        i(1)
      })),

      s("definition", fmt([[
        \begin{{definition}}
            {}
        \end{{definition}}]], {
        i(1, "Definition")
      })),

      s("lemma", fmt([[
        \begin{{lemma}}
            {}
        \end{{lemma}}]], {
        i(1, "Lemma statement")
      })),

      -- Hyperlinks
      s("href", fmt("\\href{{{}}}{{{}}}", {
        i(1, "https://example.com"),
        i(2, "link text")
      })),

      -- Footnote
      s("footnote", fmt("\\footnote{{{}}}", {
        i(1, "Footnote text")
      })),

      -- Verbatim/code
      s("verbatim", fmt([[
        \begin{{verbatim}}
        {}
        \end{{verbatim}}]], {
        i(1, "Code or text")
      })),

      -- Comments
      s("comment", fmt("\\% {}", {
        i(1, "Comment")
      })),
    }

    ls.add_snippets("tex", latex_snippets)
  '';
}
