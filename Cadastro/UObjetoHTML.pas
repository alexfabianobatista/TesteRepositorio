unit UObjetoHTML;

interface
  Type
    TObjetoHTML = Class
      private
        procedure Padroes();
      published
      public
        Codigo : Integer;
        Tag: String;
        Html: String;
        aSrc: String;
        aHref: String;
        aClass: String;
        aWidth: Integer;
        aHeight: Integer;
        cssColor: String;
        cssFontFamily: String;
        cssFontSize: String;
        cssFontStyle: String;
        cssTextDecoration: String;
        cssFontWeight: String;
        cssWidth: Integer;
        cssHeight: Integer;
        cssMarginLeft: Integer;
        cssMarginRight: Integer;
        cssMarginTop: Integer;
        cssMarginBottom: Integer;
        cssPaddingLeft: Integer;
        cssPaddingRight: Integer;
        cssPaddingTop: Integer;
        cssPaddingBottom: Integer;
        cssBorderWidth: Integer;
        cssBorderColor: String;
        cssBorderStyle: String;
        cssBorderCollpase: String;
        cssBorderRadius: Integer;
        cssBackgroundColor1: String;
        cssBackgroundColor2: String;
        cssBackgroundDirection: String;
        cssFloat: String;
        cssTextAlign: String;
        cssListStyleType : String;
        cssBoxSizing : String;

        constructor Create; overload;
        constructor Create(Codigo : Integer; Tag : String); overload;
        constructor Create(Codigo : Integer; Tag, Html : String); overload;
        constructor Create(Codigo : Integer; Tag, Html, Classe : String); overload;
        constructor Create(Codigo : Integer; Tag, Html, Classe, Src : String); overload;
      End;

implementation

{ TObjetoHTML }

procedure TObjetoHTML.Padroes;
begin
  Self.Html := '';
  Self.aSrc := '';
  Self.aHref := '';
  Self.aClass := 'Nenhuma';
  Self.aWidth := 0;
  Self.aHeight := 0;
  Self.cssColor := 'None';
  Self.cssFontFamily := 'None';
  Self.cssFontSize := 'Unset';
  Self.cssFontStyle := 'Normal';
  Self.cssTextDecoration := 'None';
  Self.cssFontWeight := 'Normal';
  Self.cssWidth := 0;
  Self.cssHeight := 0;
  Self.cssMarginLeft := 0;
  Self.cssMarginRight := 0;
  Self.cssMarginTop := 0;
  Self.cssMarginBottom := 0;
  Self.cssPaddingLeft := 0;
  Self.cssPaddingRight := 0;
  Self.cssPaddingTop := 0;
  Self.cssPaddingBottom := 0;
  Self.cssBorderWidth := 0;
  Self.cssBorderColor := 'None';
  Self.cssBorderStyle := 'None';
  Self.cssBorderCollpase := 'Separate';
  Self.cssBorderRadius := 0;
  Self.cssBackgroundColor1 := 'Transparent';
  Self.cssBackgroundColor2 := 'Transparent';
  Self.cssBackgroundDirection := 'Left';
  Self.cssFloat := 'None';
  Self.cssTextAlign := 'Left';
  Self.cssListStyleType := 'Disc';
end;

constructor TObjetoHTML.Create;
begin
  Padroes;
end;

constructor TObjetoHTML.Create(Codigo : Integer; Tag : String);
begin
  Padroes;
  Self.Codigo := Codigo;
  Self.Tag := Tag;
end;

constructor TObjetoHTML.Create(Codigo : Integer; Tag, Html : String);
begin
  Padroes;
  Self.Codigo := Codigo;
  Self.Tag := Tag;
  Self.Html := Html;
end;

constructor TObjetoHTML.Create(Codigo : Integer; Tag, Html, Classe : String);
begin
  Padroes;
  Self.Codigo := Codigo;
  Self.Tag := Tag;
  Self.Html := Html;
  Self.aClass := Classe;
end;

constructor TObjetoHTML.Create(Codigo : Integer; Tag, Html, Classe, Src : String);
begin
  Padroes;
  Self.Codigo := Codigo;
  Self.Tag := Tag;
  Self.Html := Html;
  Self.aClass := Classe;
  Self.aSrc := Src;
end;



end.
