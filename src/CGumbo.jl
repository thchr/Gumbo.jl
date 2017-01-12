module CGumbo

# immutable types corresponding to structs from gumbo.h
# also various enums from gumbo.h

immutable Vector  # Gumbo vector
    data::Ptr{Ptr{Void}}
    length::Cuint
    capacity::Cuint
end

immutable StringPiece
    data::Ptr{UInt8}
    length::Csize_t
end

immutable SourcePosition
    line::Cuint
    column::Cuint
    offset::Cuint
end

immutable Text
    text::Ptr{UInt8}
    original_text::StringPiece
    start_pos::SourcePosition
end

# GumboNodeType enum

const DOCUMENT = Int32(0)
const ELEMENT = Int32(1)
const TEXT = Int32(2)
const CDATA = Int32(3)
const WHITESPACE = Int32(4)

immutable Document
    children::Vector
    has_doctype::Bool
    name::Ptr{UInt8}
    public_identifier::Ptr{UInt8}
    system_identifier::Ptr{UInt8}
    doc_type_quirks_mode::Int32  # enum
end

immutable Attribute
    attr_namespace::Int32  # enum
    name::Ptr{UInt8}
    original_name::StringPiece
    value::Ptr{UInt8}
    original_value::StringPiece
    name_start::SourcePosition
    name_end::SourcePosition
    value_start::SourcePosition
    value_end::SourcePosition
end

immutable Element
    children::Vector
    tag::Int32  # enum
    tag_namespace::Int32  # enum
    original_tag::StringPiece
    original_end_tag::StringPiece
    start_pos::SourcePosition
    end_pos::SourcePosition
    attributes::Vector
end

immutable Node{T}
    gntype::Int32  # enum
    parent::Ptr{Node}
    index_within_parent::Csize_t
    parse_flags::Int32  # enum
    v::T
end

immutable Output
    document::Ptr{Node}
    root::Ptr{Node}
    errors::Vector
end


const TAGS = [:HTML,
              :head,
              :title,
              :base,
              :link,
              :meta,
              :style,
              :script,
              :noscript,
              :template,
              :body,
              :article,
              :section,
              :nav,
              :aside,
              :h1,
              :h2,
              :h3,
              :h4,
              :h5,
              :h6,
              :hgroup,
              :header,
              :footer,
              :address,
              :p,
              :hr,
              :pre,
              :blockquote,
              :ol,
              :ul,
              :li,
              :dl,
              :dt,
              :dd,
              :figure,
              :figcaption,
              :main,
              :div,
              :a,
              :em,
              :strong,
              :small,
              :s,
              :cite,
              :q,
              :dfn,
              :abbr,
              :data,
              :time,
              :code,
              :var,
              :samp,
              :kbd,
              :sub,
              :sup,
              :i,
              :b,
              :u,
              :mark,
              :ruby,
              :rt,
              :rp,
              :bdi,
              :bdo,
              :span,
              :br,
              :wbr,
              :ins,
              :del,
              :image,
              :img,
              :iframe,
              :embed,
              :object,
              :param,
              :video,
              :audio,
              :source,
              :track,
              :canvas,
              :map,
              :area,
              :math,
              :mi,
              :mo,
              :mn,
              :ms,
              :mtext,
              :mglyph,
              :malignmark,
              :annotation_xml,
              :svg,
              :foreignobject,
              :desc,
              :table,
              :caption,
              :colgroup,
              :col,
              :tbody,
              :thead,
              :tfoot,
              :tr,
              :td,
              :th,
              :form,
              :fieldset,
              :legend,
              :label,
              :input,
              :button,
              :select,
              :datalist,
              :optgroup,
              :option,
              :textarea,
              :keygen,
              :output,
              :progress,
              :meter,
              :details,
              :summary,
              :menu,
              :menuitem,
              :applet,
              :acronym,
              :bgsound,
              :dir,
              :frame,
              :frameset,
              :noframes,
              :isindex,
              :listing,
              :xmp,
              :nextid,
              :noembed,
              :plaintext,
              :rb,
              :strike,
              :basefont,
              :big,
              :blink,
              :center,
              :font,
              :marquee,
              :multicol,
              :nobr,
              :spacer,
              :tt,
              :unknown
              ]

end
