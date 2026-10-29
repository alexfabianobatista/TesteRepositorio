unit UEditorHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, StdCtrls, ComCtrls, Buttons, UBiblioteca,
  SHDocVw, Menus, StrUtils, DB, DBClient, Grids, DBGrids, UObjetoHTML,
  ImgList, UItemHTML, Spin, TypInfo;

type
  TFEditorHTML = class(TForm)
    Panel1: TPanel;
    PUpNavegacao: TPopupMenu;
    Remover1: TMenuItem;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    TVObjetos: TTreeView;
    Panel2: TPanel;
    Panel4: TPanel;
    WebBrowser1: TWebBrowser;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    TVNavegacao: TTreeView;
    Splitter2: TSplitter;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    PgcEstilo: TPageControl;
    TabSheet10: TTabSheet;
    ScrollBox11: TScrollBox;
    Label31: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    CBCssFontFamily: TComboBox;
    CBCssFontStyle: TComboBox;
    CBCssTextDecoration: TComboBox;
    CBCssColor: TComboBox;
    TabSheet11: TTabSheet;
    ScrollBox12: TScrollBox;
    Label19: TLabel;
    Label15: TLabel;
    TBCssHeight: TTrackBar;
    TBCssWidth: TTrackBar;
    TabSheet12: TTabSheet;
    ScrollBox13: TScrollBox;
    Label20: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    TBCssMarginLeft: TTrackBar;
    TBCssMarginRight: TTrackBar;
    TBCssMarginTop: TTrackBar;
    TBCssMarginBottom: TTrackBar;
    TabSheet13: TTabSheet;
    ScrollBox14: TScrollBox;
    Label24: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    TBCssPaddingLeft: TTrackBar;
    TBCssPaddingRight: TTrackBar;
    TBCssPaddingTop: TTrackBar;
    TBCssPaddingBottom: TTrackBar;
    TabSheet14: TTabSheet;
    ScrollBox15: TScrollBox;
    Label26: TLabel;
    Label27: TLabel;
    TBCssBorderWidth: TTrackBar;
    CBCssBorderColor: TComboBox;
    TabSheet15: TTabSheet;
    ScrollBox16: TScrollBox;
    Label30: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    CBCssBackgroundDirection: TComboBox;
    CBCssBackgroundColor1: TComboBox;
    CBCssBackgroundColor2: TComboBox;
    TabSheet16: TTabSheet;
    ScrollBox17: TScrollBox;
    Label37: TLabel;
    CBCssFloat: TComboBox;
    GroupBox4: TGroupBox;
    PgcAtributos: TPageControl;
    TabTexto: TTabSheet;
    ScrollBox6: TScrollBox;
    Label14: TLabel;
    TabImagens: TTabSheet;
    ScrollBox3: TScrollBox;
    Label5: TLabel;
    EdAtribImagensLink: TEdit;
    TabAcoes: TTabSheet;
    ScrollBox2: TScrollBox;
    Label6: TLabel;
    Label10: TLabel;
    EdAtribAcoesTexto: TEdit;
    EdAtribAcoesLink: TEdit;
    TabItemLista: TTabSheet;
    ScrollBox8: TScrollBox;
    Label7: TLabel;
    EdAtribItemListaTexto: TEdit;
    TabContainers: TTabSheet;
    ScrollBox10: TScrollBox;
    Label3: TLabel;
    CbAtribContainersClasse: TComboBox;
    Label2: TLabel;
    CBCssFontWeight: TComboBox;
    CBCssFontSize: TComboBox;
    Label4: TLabel;
    CBCssBorderStyle: TComboBox;
    Label1: TLabel;
    Label8: TLabel;
    TBAtribImagensHeight: TTrackBar;
    TBAtribImagensWidth: TTrackBar;
    CBCssBorderCollapse: TComboBox;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Adicionar1: TMenuItem;
    Itempersonalizado1: TMenuItem;
    Label11: TLabel;
    CBCssTextAlign: TComboBox;
    TmAtualizarHtml: TTimer;
    Moverparacima1: TMenuItem;
    Moverparabaixo1: TMenuItem;
    Label12: TLabel;
    TBCssBorderRadius: TTrackBar;
    TabLista: TTabSheet;
    BtAtribAdicionarItens: TButton;
    SeAtribQtItens: TSpinEdit;
    Label13: TLabel;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Label35: TLabel;
    CBCssListDtyleType: TComboBox;
    Salvar1: TMenuItem;
    Limpar1: TMenuItem;
    Arquivo1: TMenuItem;
    EdAtribTextoTexto: TEdit;
    procedure TVNavegacaoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure WebBrowser1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure WebBrowser1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TVObjetosDblClick(Sender: TObject);
    procedure AtualizaHTML(); 
    procedure TnLoop(Node : TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure TVNavegacaoChange(Sender: TObject; Node: TTreeNode);
    function TagCorrespondenteAbre(Node : TTreeNode; Definitivo : Boolean): String;
    function TagCorrespondenteFecha(Node : TTreeNode): String;
    procedure TVNavegacaoCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TVNavegacaoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure AtualizaInformacoes;
    procedure CbAtribContainersClasseChange(Sender: TObject);
    procedure Remover1Click(Sender: TObject);
    procedure CBCssColorChange(Sender: TObject);
    procedure CBCssFontFamilyChange(Sender: TObject);
    procedure CBCssFontStyleChange(Sender: TObject);
    procedure CBCssTextDecorationChange(Sender: TObject);
    procedure CBCssFontWeightChange(Sender: TObject);
    procedure TBCssHeightChange(Sender: TObject);
    procedure CBCssFontSizeChange(Sender: TObject);
    procedure TBCssWidthChange(Sender: TObject);
    procedure TBCssMarginLeftChange(Sender: TObject);
    procedure TBCssMarginRightChange(Sender: TObject);
    procedure TBCssMarginTopChange(Sender: TObject);
    procedure TBCssMarginBottomChange(Sender: TObject);
    procedure TBCssPaddingLeftChange(Sender: TObject);
    procedure TBCssPaddingRightChange(Sender: TObject);
    procedure TBCssPaddingTopChange(Sender: TObject);
    procedure TBCssPaddingBottomChange(Sender: TObject);
    procedure CBCssBorderStyleChange(Sender: TObject);
    procedure CBCssBorderColorChange(Sender: TObject);
    procedure TBCssBorderWidthChange(Sender: TObject);
    procedure CBCssBackgroundColor1Change(Sender: TObject);
    procedure CBCssBackgroundColor2Change(Sender: TObject);
    procedure CBCssBackgroundDirectionChange(Sender: TObject);
    procedure CBCssFloatChange(Sender: TObject);
    function StyleString(TagHTML : TObjetoHTML): String;
    procedure TBAtribImagensHeightChange(Sender: TObject);
    procedure TBAtribImagensWidthChange(Sender: TObject);
    procedure Itempersonalizado1Click(Sender: TObject);
    procedure AdicionaArtigoSimples(Subtextos : Integer; Alinhamento : String; Vezes : Integer);
    procedure AdicionaTabelaPersonalizada(Linhas, Colunas : Integer; Vezes : Integer);
    procedure AdicionaCartaoInformativo(LadoImagem : String; Vezes : Integer); 
    procedure AdicionaExposicaoDeProdutos(Produtos : Integer; MostrarPreco : Boolean; Vezes : Integer);
    procedure AdicionaFelizAniversario(CorDaLetra : String ;Vezes : Integer);
    procedure AdicionaRodape(ComRedes : Boolean; Fundo : String; Vezes : Integer);
    procedure CBCssTextAlignChange(Sender: TObject);
    function Sequencia(): Integer;
    procedure WebBrowser1TitleChange(Sender: TObject; const Text: WideString);
    procedure TmAtualizarHtmlTimer(Sender: TObject);
    procedure IntervaloParaAtualizarHTML;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Moverparacima1Click(Sender: TObject);
    procedure Moverparabaixo1Click(Sender: TObject);
    procedure EdAtribImagensLinkKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdAtribAcoesTextoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdAtribAcoesLinkKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdAtribItemListaTextoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TBCssBorderRadiusChange(Sender: TObject);
    procedure BtAtribAdicionarItensClick(Sender: TObject);
    procedure CBCssListDtyleTypeChange(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure SalvarEdicao;
    procedure CarregarEdicao;
    function SemDelimitadores(Texto : string): string;
    procedure EdAtribTextoTextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function Traduz(CorBR : string): String;
  private
    TabelaDeTags : TVariantMap;
    MapaDeTags : TVariantMap;
    TagsClicaveis : TVariantMap;
    Traducoes : TVariantMap;
    ItemSelecionado : TTreeNode;
    InfosSelecionadas : TObjetoHTML;
    CodElementoAtual : Integer;
    EdicaoSalva : Boolean;
    EdicaoAtual : TStringList;
    { Private declarations }
  public
    HeadHTML : string;
    CorpoHTML : String;
    CorpoHTMLFinal : String;
    EdicaoStream : TMemoryStream;
    { Public declarations }
  end;

var
  FEditorHTML: TFEditorHTML;
  FItemHTML : TFItemHTML;
const
  Delimiter : String = '¬';
  BreakLine : Char = #10;


implementation

{$R *.dfm}

procedure TFEditorHTML.FormCreate(Sender: TObject);
var
  page : Integer;
begin
  WebBrowser1.Navigate('about:blank');

  TabelaDeTags := TVariantMap.Create;
  TabelaDeTags.addValue('Corpo','body');
  TabelaDeTags.addValue('Divisão','div');
  TabelaDeTags.addValue('Gigante','h1');
  TabelaDeTags.addValue('Grande','h2');
  TabelaDeTags.addValue('Médio','h3');
  TabelaDeTags.addValue('Pequeno','h4');
  TabelaDeTags.addValue('Parágrafo','p');
  TabelaDeTags.addValue('Negrito','b');
  TabelaDeTags.addValue('Itálico','i');
  TabelaDeTags.addValue('Fonte','img');
  TabelaDeTags.addValue('Link','a');
  TabelaDeTags.addValue('Quebra de linha','br');
  TabelaDeTags.addValue('Linha horizontal','hr');
  TabelaDeTags.addValue('Tabela','table');
  TabelaDeTags.addValue('Linha','tr');
  TabelaDeTags.addValue('Coluna','td');
  TabelaDeTags.addValue('Ordenada','ol');
  TabelaDeTags.addValue('Não ordenada','ul');
  TabelaDeTags.addValue('Item','li');
  TabelaDeTags.addValue('Centralizador','center');
             
  Traducoes := TVariantMap.Create;
  Traducoes.addValue('Nenhuma','None');
  Traducoes.addValue('Transparente','Transparent');
  Traducoes.addValue('Ciano','Aqua');
  Traducoes.addValue('Preto','Black');
  Traducoes.addValue('Azul','Blue');
  Traducoes.addValue('Fúcsia','Fuchsia');
  Traducoes.addValue('Cinza','Gray');
  Traducoes.addValue('Verde','Green');
  Traducoes.addValue('Limão','Lime');
  Traducoes.addValue('Marrom','Maroon');
  Traducoes.addValue('Marinho','Navy');
  Traducoes.addValue('Oliva','Olive');
  Traducoes.addValue('Roxo','Purple');
  Traducoes.addValue('Vermelho','Red');
  Traducoes.addValue('Prata','Silver');
  Traducoes.addValue('Cerceta','Teal');
  Traducoes.addValue('Branco','White');
  Traducoes.addValue('Amarelo','Yellow');
  Traducoes.addValue('Trigo','Wheat');
  Traducoes.addValue('Violeta','Violet');
  Traducoes.addValue('Rosa','Pink');
  Traducoes.addValue('Tomate','Tomato');
  Traducoes.addValue('Salmão','Salmon');
  Traducoes.addValue('Laranja','Orange');
  Traducoes.addValue('Ouro','Gold');

  MapaDeTags := TVariantMap.Create;
  MapaDeTags.addValue('div',4);
  MapaDeTags.addValue('h1',0);
  MapaDeTags.addValue('h2',0);
  MapaDeTags.addValue('h3',0);
  MapaDeTags.addValue('h4',0);
  MapaDeTags.addValue('p',0);
  MapaDeTags.addValue('b',0);
  MapaDeTags.addValue('i',0);  
  MapaDeTags.addValue('img',1);
  MapaDeTags.addValue('a',2);
  MapaDeTags.addValue('li',3);
  MapaDeTags.addValue('ol',5);
  MapaDeTags.addValue('ul',5);

  TagsClicaveis := TVariantMap.Create;
  TagsClicaveis.addValue('h1',1);
  TagsClicaveis.addValue('h2',1);
  TagsClicaveis.addValue('h3',1);
  TagsClicaveis.addValue('h4',1);
  TagsClicaveis.addValue('h5',1);
  TagsClicaveis.addValue('p',1);
  TagsClicaveis.addValue('b',1);
  TagsClicaveis.addValue('i',1);
  TagsClicaveis.addValue('img',1);
  TagsClicaveis.addValue('a',1);
  TagsClicaveis.addValue('li',1);

  HeadHTML := '<head>';
  HeadHTML := HeadHTML + '<title></title>';
  HeadHTML := HeadHTML + '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">';
  HeadHTML := HeadHTML + '<style>p{margin-bottom:0px !important;}</style>';
  HeadHTML := HeadHTML + '</head>';

  PgcAtributos.Pages[0].TabVisible := False;
  PgcAtributos.Pages[1].TabVisible := False;
  PgcAtributos.Pages[2].TabVisible := False;
  PgcAtributos.Pages[3].TabVisible := False;
  PgcAtributos.Pages[4].TabVisible := False;
  PgcAtributos.Pages[5].TabVisible := False;

  EdicaoAtual := TStringList.Create;
  EdicaoStream := TMemoryStream.Create;

  EdicaoSalva := True;

  CodElementoAtual := 1;
end;

function TFEditorHTML.Sequencia(): Integer;
var
  wAux : Integer;
begin
  wAux := Self.CodElementoAtual;
  Inc(CodElementoAtual);
  Result := wAux;
end;

procedure TFEditorHTML.TVNavegacaoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  //Manter
end;  

procedure TFEditorHTML.WebBrowser1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  //Manter
end; 

procedure TFEditorHTML.TmAtualizarHtmlTimer(Sender: TObject);
begin
  AtualizaHTML;
end;

procedure TFEditorHTML.IntervaloParaAtualizarHTML;
begin
  TmAtualizarHtml.Enabled := False;
  TmAtualizarHtml.Enabled := True;
end; 

procedure TFEditorHTML.TVNavegacaoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  tnFonte, tnDestino, tnNovo : TTreeNode;
  novoObjHtml : TObjetoHTML;
begin
  if TVNavegacao.GetNodeAt(X,Y) <> nil then
  begin
    if TTreeView(Source) = TVNavegacao then
    begin
      tnFonte := TVNavegacao.Selected;
      tnDestino := TVNavegacao.GetNodeAt(X,Y);
      tnFonte.MoveTo(tnDestino, naAddChild);
      tnDestino.Expand(False);
      TVNavegacaoChange(Sender, tnFonte);
    end
    else if TTreeView(Source) = TVObjetos then
    begin
      tnFonte := TVObjetos.Selected;
      tnDestino := TVNavegacao.GetNodeAt(X,Y);

      if not tnFonte.HasChildren then
      begin
        novoObjHtml := TObjetoHTML.Create;
        novoObjHtml.Codigo := Sequencia;
        novoObjHtml.Tag := TabelaDeTags.getValue(tnFonte.Text);

        tnNovo := TVNavegacao.Items.AddChildObject(tnDestino, tnFonte.Text, novoObjHtml);
        tnDestino.Expand(False);
        TVNavegacaoChange(Sender, tnFonte);
      end;
    end;
  end;
end;

procedure TFEditorHTML.WebBrowser1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  TVNavegacaoDragDrop(Sender, TVObjetos, 0, 0);
end;

procedure TFEditorHTML.TVObjetosDblClick(Sender: TObject);
begin
  TVNavegacaoDragDrop(Sender, TVObjetos, 0, 0);
end;

procedure TFEditorHTML.AtualizaHTML();
var
  CurItem, CurItem2 : TTreeNode;
begin
  CorpoHTML := '<body>';
  CorpoHTMLFinal := '<body>';
  TnLoop(TVNavegacao.Items.GetFirstNode);
  CorpoHTML := CorpoHTML + '</body>';
  CorpoHTMLFinal := CorpoHTMLFinal + '</body>';
  Bib.WBLoadHTML(WebBrowser1,'<html>' + HeadHTML + CorpoHTML + '</html>');
  TmAtualizarHtml.Enabled := False;
  EdicaoSalva := False;
end;

procedure TFEditorHTML.TnLoop(Node : TTreeNode);
var
  SonNode : TTreeNode;
begin
  if Node.HasChildren then
  begin
    SonNode := Node.getFirstChild;
    while Assigned(SonNode) do
    begin
      CorpoHTML := CorpoHTML + TagCorrespondenteAbre(SonNode, False);
      CorpoHTMLFinal := CorpoHTMLFinal + TagCorrespondenteAbre(SonNode, True);
      if Assigned(SonNode.Data) then
      begin
        CorpoHTML := CorpoHTML + TObjetoHTML(SonNode.Data).Html;
        CorpoHTMLFinal := CorpoHTMLFinal + TObjetoHTML(SonNode.Data).Html;
      end;
      TnLoop(SonNode);
      CorpoHTML := CorpoHTML + TagCorrespondenteFecha(SonNode);
      CorpoHTMLFinal := CorpoHTMLFinal + TagCorrespondenteFecha(SonNode);
      SonNode := SonNode.getNextSibling;
    end;
  end;
end;

function TFEditorHTML.Traduz(CorBR : string): String;
begin
  if Traducoes.contem(CorBR) then
    Result := Traducoes.getValue(CorBR)
  else
    Result := CorBR;
end;

function TFEditorHTML.StyleString(TagHTML : TObjetoHTML): String;
var
  wStyle : String;
begin
  wStyle := '';
  if Assigned(TagHTML) then
  begin
    if Traduz(TagHTML.cssColor) <> 'None' then
      wStyle := wStyle + 'color:' + Traduz(TagHTML.cssColor) + ';';
    if TagHTML.cssFontFamily <> 'None' then
      wStyle := wStyle + 'font-family:' + TagHTML.cssFontFamily + ';';
    if TagHTML.cssFontSize <> 'Unset' then
      wStyle := wStyle + 'font-size:' + TagHTML.cssFontSize + 'px;';
    if TagHTML.cssFontStyle <> 'Normal' then
      wStyle := wStyle + 'font-style:' + TagHTML.cssFontStyle + ';';
    if TagHTML.cssTextDecoration <> 'None' then
      wStyle := wStyle + 'text-decoration:' + TagHTML.cssTextDecoration + ';';
    if TagHTML.cssFontWeight <> 'Normal' then
      wStyle := wStyle + 'font-weight:' + TagHTML.cssFontWeight + ';';
    if TagHTML.cssWidth > 0 then
      wStyle := wStyle + 'width:' + IntToStr(TagHTML.cssWidth) + '%;';
    if TagHTML.cssHeight > 0 then
      wStyle := wStyle + 'height:' + IntToStr(TagHTML.cssHeight) + '%;';
    if TagHTML.cssMarginLeft > 0 then
      wStyle := wStyle + 'margin-left:' + IntToStr(TagHTML.cssMarginLeft) + '%;';
    if TagHTML.cssMarginRight > 0 then
      wStyle := wStyle + 'margin-right:' + IntToStr(TagHTML.cssMarginRight) + '%;';
    if TagHTML.cssMarginTop > 0 then
      wStyle := wStyle + 'margin-top:' + IntToStr(TagHTML.cssMarginTop) + '%;';
    if TagHTML.cssMarginBottom > 0 then
      wStyle := wStyle + 'margin:bottom:' + IntToStr(TagHTML.cssMarginBottom) + '%;';
    if TagHTML.cssPaddingLeft > 0 then
      wStyle := wStyle + 'padding-left:' + IntToStr(TagHTML.cssPaddingLeft) + '%;';
    if TagHTML.cssPaddingRight > 0 then
      wStyle := wStyle + 'padding-right:' + IntToStr(TagHTML.cssPaddingRight) + '%;';
    if TagHTML.cssPaddingTop > 0 then
      wStyle := wStyle + 'padding-top:' + IntToStr(TagHTML.cssPaddingTop) + '%;';
    if TagHTML.cssPaddingBottom > 0 then
      wStyle := wStyle + 'padding-bottom:' + IntToStr(TagHTML.cssPaddingBottom) + '%;';
    if TagHTML.cssBorderStyle <> 'None' then
      wStyle := wStyle + 'border-style:' + TagHTML.cssBorderStyle + ';';
    if Traduz(TagHTML.cssBorderColor) <> 'None' then
      wStyle := wStyle + 'border-color:' + Traduz(TagHTML.cssBorderColor) + ';';
    if TagHTML.cssBorderWidth <> 0 then
      wStyle := wStyle + 'border-width:' + IntToStr(TagHTML.cssBorderWidth) + 'px;';
    if TagHTML.cssBorderCollpase <> 'Separate' then
      wStyle := wStyle + 'border-collapse:' + TagHTML.cssBorderCollpase + ';';
    if TagHTML.cssBorderRadius > 0 then
      wStyle := wStyle + 'border-radius:' + IntToStr(TagHTML.cssBorderRadius) + '%;';
    if TagHTML.cssFloat <> 'None' then
      wStyle := wStyle + 'float:' + TagHTML.cssFloat + ';';
    if (Traduz(TagHTML.cssBackgroundColor1) <> 'Transparent') and (Traduz(TagHTML.cssBackgroundColor2) <> 'Transparent') then
      wStyle := wStyle + 'background-image:linear-gradient(to ' + TagHTML.cssBackgroundDirection +','+ Traduz(TagHTML.cssBackgroundColor1) +','+ Traduz(TagHTML.cssBackgroundColor2) + ');'
    else if (Traduz(TagHTML.cssBackgroundColor1) <> 'Transparent') then
      wStyle := wStyle + 'background-color:' + Traduz(TagHTML.cssBackgroundColor1) + ';';
    if TagHTML.cssTextAlign <> 'Left' then
      wStyle := wStyle + 'text-align:' + TagHTML.cssTextAlign + ';';
    if TagHTML.cssListStyleType <> 'Disc' then
      wStyle := wStyle + 'list-style-type:' + TagHTML.cssListStyleType + ';';
  end;
  if wStyle = '' then
    Result := ''
  else
    Result := ' style="' + wStyle + '"';
end;

function TFEditorHTML.TagCorrespondenteAbre(Node : TTreeNode; Definitivo : Boolean): String;
var
  wInfos : TObjetoHTML;
  wTagFinal : String;
begin
  if TabelaDeTags.contem(Node.Text) then
  begin
    wTagFinal := '<' + TabelaDeTags.getValue(Node.Text);

    if Assigned(Node.Data) then
    begin
      wInfos := TObjetoHTML(Node.Data);
      if TagsClicaveis.contem(wInfos.Tag) then
      begin
        if not Definitivo then
        begin
          wTagFinal := wTagFinal + ' id="' + IntToStr(wInfos.Codigo) + '"';
          wTagFinal := wTagFinal + ' onclick="document.title = this.id; if(!e) var e = window.event;e.cancelBubble = true;"';
        end;
      end;

      if wInfos.aSrc <> '' then
        wTagFinal := wTagFinal + ' src="' + wInfos.aSrc +  '"';
      if (wInfos.aHref <> '') and Definitivo then
        wTagFinal := wTagFinal + ' href="' + wInfos.aHref +  '"';
      if (wInfos.aClass <> 'Nenhuma') and (wInfos.aClass <> '') then
        wTagFinal := wTagFinal + ' class="' + wInfos.aClass +  '"';
      if wInfos.aWidth > 0 then
        wTagFinal := wTagFinal + ' width="' + IntToStr(wInfos.aWidth) +  'px"';
      if wInfos.aHeight > 0 then
        wTagFinal := wTagFinal + ' height="' + IntToStr(wInfos.aHeight) +  'px"';
      wTagFinal := wTagFinal + StyleString(wInfos);
    end;
    wTagFinal := wTagFinal + '>';
    Result := wTagFinal;
  end
  else
    Result := '';
end;

function TFEditorHTML.TagCorrespondenteFecha(Node : TTreeNode): String;
begin
  if TabelaDeTags.contem(Node.Text) then
    Result := '</' + TabelaDeTags.getValue(Node.Text) + '>'
  else
    Result := '';
end;

procedure TFEditorHTML.TVNavegacaoChange(Sender: TObject; Node: TTreeNode);
begin
  if Assigned(Node) then
  begin   
    ItemSelecionado := Node;
    InfosSelecionadas := TObjetoHTML(Node.Data);
    if Assigned(TVNavegacao.Selected) then
    begin
      ItemSelecionado := TVNavegacao.Selected;
      TVNavegacao.Selected.MakeVisible;
    end;
  end
  else if Assigned(TVNavegacao.Selected) then
  begin
    ItemSelecionado := TVNavegacao.Selected;
    TVNavegacao.Selected.MakeVisible;
  end
  else
  begin
    InfosSelecionadas.Destroy;
    ItemSelecionado.Destroy;
  end;
  PgcEstilo.Visible := True;
  AtualizaInformacoes();
  AtualizaHTML;
end;

procedure TFEditorHTML.WebBrowser1TitleChange(Sender: TObject;
  const Text: WideString);
var
  Node : TTreeNode;
begin
  if Text <> '' then
  begin
    Node := TVNavegacao.Items.GetFirstNode;
    while Assigned(Node) do
    begin
      if Assigned(Node.Data) then
        if IntToStr(TObjetoHTML(Node.Data).Codigo) = Text then
        begin
          Node.Selected := True;
          AtualizaInformacoes();
          Break;
        end;
      Node := Node.GetNext;
    end;
  end;
end;

procedure TFEditorHTML.TVNavegacaoCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Selected then
  begin
    Sender.Canvas.Brush.Color := clHighlight;
    Sender.Canvas.Font.Color  := clBtnHighlight;
  end
  else
  begin
    Sender.Canvas.Brush.Color := TTreeView(Sender).Color;
    Sender.Canvas.Font.Color  := TTreeView(Sender).Font.Color;
  end;
end;

procedure TFEditorHTML.AtualizaInformacoes;
begin
  if Assigned(InfosSelecionadas) then
  begin
    if MapaDeTags.contem(InfosSelecionadas.Tag) then
    begin
      PgcAtributos.ActivePageIndex := MapaDeTags.getValue(InfosSelecionadas.Tag);
    end
    else
      PgcAtributos.ActivePageIndex := -1;

    EdAtribTextoTexto.Text :=   InfosSelecionadas.Html;
    EdAtribImagensLink.Text :=    InfosSelecionadas.aSrc;
    EdAtribImagensLink.Text :=    InfosSelecionadas.aSrc;
    EdAtribAcoesTexto.Text :=     InfosSelecionadas.Html;
    EdAtribAcoesLink.Text :=   InfosSelecionadas.aHref;
    EdAtribItemListaTexto.Text := InfosSelecionadas.Html;
    CbAtribContainersClasse.Text := InfosSelecionadas.aClass;
    TBAtribImagensWidth.Position := InfosSelecionadas.aWidth;
    TBAtribImagensHeight.Position := InfosSelecionadas.aHeight;

    CBCssColor.Text := InfosSelecionadas.cssColor;
    CBCssFontFamily.Text := InfosSelecionadas.cssFontFamily;
    CBCssFontSize.Text := InfosSelecionadas.cssFontSize;
    CBCssFontStyle.Text := InfosSelecionadas.cssFontStyle;
    CBCssTextDecoration.Text := InfosSelecionadas.cssTextDecoration;
    CBCssFontWeight.Text := InfosSelecionadas.cssFontWeight;

    TBCssWidth.Position := InfosSelecionadas.cssWidth;
    TBCssHeight.Position := InfosSelecionadas.cssHeight;

    TBCssMarginLeft.Position := InfosSelecionadas.cssMarginLeft;
    TBCssMarginRight.Position := InfosSelecionadas.cssMarginRight;
    TBCssMarginTop.Position := InfosSelecionadas.cssMarginTop;
    TBCssMarginBottom.Position := InfosSelecionadas.cssMarginBottom;

    TBCssPaddingLeft.Position := InfosSelecionadas.cssPaddingLeft;
    TBCssPaddingRight.Position := InfosSelecionadas.cssPaddingRight;
    TBCssPaddingTop.Position := InfosSelecionadas.cssPaddingTop;
    TBCssPaddingBottom.Position := InfosSelecionadas.cssPaddingBottom;

    CBCssBorderColor.Text := InfosSelecionadas.cssBorderColor;
    CBCssBorderStyle.Text := InfosSelecionadas.cssBorderStyle;
    TBCssBorderWidth.Position := InfosSelecionadas.cssBorderWidth;
    CBCssBorderCollapse.Text := InfosSelecionadas.cssBorderCollpase;
    TBCssBorderRadius.Position := InfosSelecionadas.cssBorderRadius;

    CBCssBackgroundColor1.Text := InfosSelecionadas.cssBackgroundColor1;
    CBCssBackgroundColor2.Text := InfosSelecionadas.cssBackgroundColor2;
    CBCssBackgroundDirection.Text := InfosSelecionadas.cssBackgroundDirection;

    CBCssFloat.Text := InfosSelecionadas.cssFloat;
    CBCssTextAlign.Text := InfosSelecionadas.cssTextAlign;

    CBCssListDtyleType.Text := InfosSelecionadas.cssListStyleType;
  end
  else
  begin
    EdAtribTextoTexto.Text :=        '';
    EdAtribImagensLink.Text :=       '';
    EdAtribImagensLink.Text :=       '';
    EdAtribAcoesTexto.Text :=        '';
    EdAtribAcoesLink.Text :=         '';
    EdAtribItemListaTexto.Text :=    '';
    CbAtribContainersClasse.Text :=  ''; 
    TBAtribImagensWidth.Position := 0;
    TBAtribImagensHeight.Position := 0;

    CBCssColor.Text := CBCssColor.Items[0];
    CBCssFontFamily.Text := CBCssFontFamily.Items[0];
    CBCssFontSize.Text := CBCssFontSize.Items[0];
    CBCssFontStyle.Text := CBCssFontStyle.Items[0];
    CBCssTextDecoration.Text := CBCssTextDecoration.Items[0];
    CBCssFontWeight.Text := CBCssFontWeight.Items[0];

    TBCssWidth.Position := 0;
    TBCssHeight.Position := 0;

    TBCssMarginLeft.Position := 0;
    TBCssMarginRight.Position := 0;
    TBCssMarginTop.Position := 0;
    TBCssMarginBottom.Position := 0;

    TBCssPaddingLeft.Position := 0;
    TBCssPaddingRight.Position := 0;
    TBCssPaddingTop.Position := 0;
    TBCssPaddingBottom.Position := 0;

    CBCssBorderColor.Text := CBCssBorderColor.Items[0];
    CBCssBorderStyle.Text := CBCssBorderStyle.Items[0];
    TBCssBorderWidth.Position := 0;
    CBCssBorderCollapse.Text := CBCssBorderCollapse.Items[0]; 
    TBCssBorderRadius.Position := 0;

    CBCssBackgroundColor1.Text := CBCssBackgroundColor1.Items[0];
    CBCssBackgroundColor2.Text := CBCssBackgroundColor2.Items[0];
    CBCssBackgroundDirection.Text := CBCssBackgroundDirection.Items[0];

    CBCssFloat.Text := CBCssFloat.Items[0];
    CBCssTextAlign.Text := CBCssTextAlign.Items[0];

    CBCssListDtyleType.Text := CBCssListDtyleType.Items[0];
    
    PgcAtributos.ActivePageIndex := -1;
  end;
end;

procedure TFEditorHTML.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  wEscolha : Integer;
begin
  if not EdicaoSalva then
  begin
    wEscolha := MessageDlg('Deseja salvar a edição?',
                  mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if wEscolha = mrYes then
    begin
      SalvarEdicao;
      ModalResult := mrOk;
    end
    else if wEscolha = mrNo then
      ModalResult := mrNo
    else
      Abort;
  end
  else
    ModalResult := mrOk;
end;

procedure TFEditorHTML.BtAtribAdicionarItensClick(Sender: TObject);
var
  novoObjHtml : TObjetoHTML;
  i : Integer;
begin
  if Assigned(ItemSelecionado) then
  begin
    for i := 1 to SeAtribQtItens.Value do
    begin
      novoObjHtml := TObjetoHTML.Create;
      novoObjHtml.Codigo := Sequencia;
      novoObjHtml.Tag := 'li';

      TVNavegacao.Items.AddChildObject(ItemSelecionado, 'Item', novoObjHtml);
    end;
    ItemSelecionado.Expand(False);
    AtualizaHTML;
  end;
end;

procedure TFEditorHTML.Itempersonalizado1Click(Sender: TObject);
begin
  if FItemHTML = nil then
    FItemHTML := TFItemHTML.Create(Application);
  FItemHTML.ShowModal;
  if FItemHTML.ModalResult = mrOk then
  begin
    if FItemHTML.CBItem.ItemIndex <> 0 then
    begin
      if FItemHTML.CBItem.ItemIndex = 1 then
        AdicionaArtigoSimples(FItemHTML.SEArtigoSubtextos.Value, FItemHTML.CBArtigoAlinhamento.Text, FItemHTML.SENumVezes.Value)
      else if FItemHTML.CBItem.ItemIndex = 2 then
        AdicionaTabelaPersonalizada(FItemHTML.SETabelaLinhas.Value, FItemHTML.SETabelaColunas.Value, FItemHTML.SENumVezes.Value)
      else if FItemHTML.CBItem.ItemIndex = 3 then
        AdicionaCartaoInformativo(FItemHTML.CBCartaoLadoImagem.Text, FItemHTML.SENumVezes.Value)
      else if FItemHTML.CBItem.ItemIndex = 4 then
        AdicionaExposicaoDeProdutos(FItemHTML.SEExposicaoItens.Value, FItemHTML.CBExposicaoMostrarPreco.Checked, FItemHTML.SENumVezes.Value)
      else if FItemHTML.CBItem.ItemIndex = 5 then
        AdicionaFelizAniversario(FItemHTML.CBCorDaLetra.Text, FItemHTML.SENumVezes.Value)
      else if FItemHTML.CBItem.ItemIndex = 6 then
        AdicionaRodape(FItemHTML.CBComRedesSociais.Checked,FItemHTML.CBFundo.Text,FItemHTML.SENumVezes.Value);
    end;
  end;
end;

procedure TFEditorHTML.Limpar1Click(Sender: TObject);
begin
  TVNavegacao.Items.Clear;
  TVNavegacao.Items.Add(nil, 'Corpo');
  EdicaoSalva := False;
  AtualizaHTML;
end;

procedure TFEditorHTML.Salvar1Click(Sender: TObject);
begin
  SalvarEdicao;
end;

procedure TFEditorHTML.CarregarEdicao();
var
  wNode : TTreeNode;
  wLinha, wNodeText : String;
  wItem : TObjetoHTML;
  strings : TStringList;
  wLevelAtual, wLevel, i : Integer;
begin
  if EdicaoStream.Size > 0 then
  begin
    wLevelAtual := 0;
    strings := TStringList.Create;
    TVNavegacao.Items.Clear;
    wNode := nil;

    EdicaoStream.Position := 0;
    EdicaoAtual.LoadFromStream(EdicaoStream);

    for i := 0 to EdicaoAtual.Count-1 do
    begin
      Bib.Split('¬', EdicaoAtual[i], strings);

      wLevel := StrToInt(strings[0]);
      wNodeText := strings[1];

      if wLevelAtual = wLevel then
      begin
        wNode := TVNavegacao.Items.Add(wNode, wNodeText);
        wLevelAtual := wLevel;
      end
      else if wLevelAtual < wLevel then
      begin
        wNode := TVNavegacao.Items.AddChild(wNode, wNodeText);
        wLevelAtual := wLevel;
      end
      else if wLevelAtual > wLevel then
      begin
        while wLevelAtual > wLevel do
        begin
          wNode := wNode.Parent;
          wLevelAtual := wLevelAtual-1;
        end;
        wNode := TVNavegacao.Items.Add(wNode, wNodeText);
        wLevelAtual := wLevel;
      end;

      wItem := TObjetoHTML.Create;

      wItem.Codigo := Sequencia;
      wItem.Tag := strings[2];
      wItem.Html := strings[3];
      wItem.aSrc := strings[4];
      wItem.aHref := strings[5];
      wItem.aClass := strings[6];
      wItem.aWidth := StrToInt(strings[7]);
      wItem.aHeight := StrToInt(strings[8]);
      wItem.cssColor := strings[9];
      wItem.cssFontFamily := strings[10];
      wItem.cssFontSize := strings[11];
      wItem.cssFontStyle := strings[12];
      wItem.cssTextDecoration := strings[13];
      wItem.cssFontWeight := strings[14];
      wItem.cssWidth := StrToInt(strings[15]);
      wItem.cssHeight := StrToInt(strings[16]);
      wItem.cssMarginLeft := StrToInt(strings[17]);
      wItem.cssMarginRight := StrToInt(strings[18]);
      wItem.cssMarginTop := StrToInt(strings[19]);
      wItem.cssMarginBottom := StrToInt(strings[20]);
      wItem.cssPaddingLeft := StrToInt(strings[21]);
      wItem.cssPaddingRight := StrToInt(strings[22]);
      wItem.cssPaddingTop := StrToInt(strings[23]);
      wItem.cssPaddingBottom := StrToInt(strings[24]);
      wItem.cssBorderWidth := StrToInt(strings[25]);
      wItem.cssBorderColor := strings[26];
      wItem.cssBorderStyle := strings[27];
      wItem.cssBorderCollpase := strings[28];
      wItem.cssBorderRadius := StrToInt(strings[29]);
      wItem.cssBackgroundColor1 := strings[30];
      wItem.cssBackgroundColor2 := strings[31];
      wItem.cssBackgroundDirection := strings[32];
      wItem.cssFloat := strings[33];
      wItem.cssTextAlign := strings[34];
      wItem.cssListStyleType := strings[35];

      wNode.Data := wItem;
    end;
  end
  else
  begin
    TVNavegacao.Items.Clear;
    TVNavegacao.Items.Add(nil, 'Corpo');
  end;

  TVNavegacao.Selected := TVNavegacao.Items.GetFirstNode;
  TVNavegacao.Selected.Expand(False);
end;

procedure TFEditorHTML.SalvarEdicao;
var
  wNode : TTreeNode;
  wItem : TObjetoHTML;
  wLinha : String;
  wLinhas : TStringList;
begin
  wLinhas := TStringList.Create;

  wNode := TVNavegacao.Items.GetFirstNode;
  while Assigned(wNode) do
  begin
    wLinha := '';
    wLinha := wLinha + IntToStr(wNode.Level);
    wLinha := wLinha + Delimiter + wNode.Text;

    wItem := TObjetoHTML(wNode.Data);

    if not Assigned(wItem) then
    begin
      wItem := TObjetoHTML.Create;
    end;

    wLinha := wLinha + Delimiter + wItem.Tag;
    wLinha := wLinha + Delimiter + wItem.Html;
    wLinha := wLinha + Delimiter + wItem.aSrc;
    wLinha := wLinha + Delimiter + wItem.aHref;
    wLinha := wLinha + Delimiter + wItem.aClass;
    wLinha := wLinha + Delimiter + IntToStr(wItem.aWidth);
    wLinha := wLinha + Delimiter + IntToStr(wItem.aHeight);
    wLinha := wLinha + Delimiter + wItem.cssColor;
    wLinha := wLinha + Delimiter + wItem.cssFontSize;
    wLinha := wLinha + Delimiter + wItem.cssFontFamily;
    wLinha := wLinha + Delimiter + wItem.cssFontStyle;
    wLinha := wLinha + Delimiter + wItem.cssTextDecoration;
    wLinha := wLinha + Delimiter + wItem.cssFontWeight;
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssWidth);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssHeight);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssMarginLeft);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssMarginRight);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssMarginTop);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssMarginBottom);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssPaddingLeft);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssPaddingRight);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssPaddingTop);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssPaddingBottom);
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssBorderWidth);
    wLinha := wLinha + Delimiter + wItem.cssBorderColor;
    wLinha := wLinha + Delimiter + wItem.cssBorderStyle;
    wLinha := wLinha + Delimiter + wItem.cssBorderCollpase;
    wLinha := wLinha + Delimiter + IntToStr(wItem.cssBorderRadius);
    wLinha := wLinha + Delimiter + wItem.cssBackgroundColor1;
    wLinha := wLinha + Delimiter + wItem.cssBackgroundColor2;
    wLinha := wLinha + Delimiter + wItem.cssBackgroundDirection;
    wLinha := wLinha + Delimiter + wItem.cssFloat;
    wLinha := wLinha + Delimiter + wItem.cssTextAlign;
    wLinha := wLinha + Delimiter + wItem.cssListStyleType;

    wLinhas.Add(wLinha);
    wNode := wNode.GetNext;
  end;

  EdicaoAtual.Clear;
  EdicaoAtual := wLinhas;
  EdicaoStream.Clear;
  EdicaoAtual.SaveToStream(EdicaoStream);
  EdicaoSalva := True;
end;

function TFEditorHTML.SemDelimitadores(Texto : string): string;
begin
  Result := StringReplace(Texto, Delimiter, '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFEditorHTML.CbAtribContainersClasseChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.aClass := CbAtribContainersClasse.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.Remover1Click(Sender: TObject);
begin
  if (Assigned(TVNavegacao.Selected)) and (not TVNavegacao.Selected.IsFirstNode) then
    TVNavegacao.Items.Delete(TVNavegacao.Selected);
  TVNavegacaoChange(Sender, nil);
end;

procedure TFEditorHTML.Moverparacima1Click(Sender: TObject);
begin
  if (Assigned(TVNavegacao.Selected)) and (not TVNavegacao.Selected.IsFirstNode) then
  begin
    if Assigned(TVNavegacao.Selected.getPrevSibling()) then
      TVNavegacao.Selected.MoveTo(TVNavegacao.Selected.getPrevSibling, naInsert);
  end;
  TVNavegacaoChange(Sender, nil);
end;

procedure TFEditorHTML.Moverparabaixo1Click(Sender: TObject);
begin
  if (Assigned(TVNavegacao.Selected)) and (not TVNavegacao.Selected.IsFirstNode) then
  begin
    if Assigned(TVNavegacao.Selected.getNextSibling()) then
      TVNavegacao.Selected.getNextSibling.MoveTo(TVNavegacao.Selected, naInsert);
  end;
  TVNavegacaoChange(Sender, nil);
end;

procedure TFEditorHTML.CBCssColorChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssColor := CBCssColor.Text;
  IntervaloParaAtualizarHTML;
end; 

procedure TFEditorHTML.EdAtribTextoTextoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.Html := SemDelimitadores(EdAtribTextoTexto.Text);
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssFontFamilyChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssFontFamily := CBCssFontFamily.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssFontStyleChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssFontStyle := CBCssFontStyle.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssTextDecorationChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssTextDecoration := CBCssTextDecoration.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssFontWeightChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssFontWeight := CBCssFontWeight.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.TBCssHeightChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssHeight := TBCssHeight.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.CBCssFontSizeChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssFontSize := CBCssFontSize.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.TBCssWidthChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssWidth := TBCssWidth.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssMarginLeftChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssMarginLeft := TBCssMarginLeft.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssMarginRightChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssMarginRight := TBCssMarginRight.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssMarginTopChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssMarginTop := TBCssMarginTop.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssMarginBottomChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssMarginBottom := TBCssMarginBottom.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssPaddingLeftChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssPaddingLeft := TBCssPaddingLeft.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssPaddingRightChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssPaddingRight := TBCssPaddingRight.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssPaddingTopChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssPaddingTop := TBCssPaddingTop.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBCssPaddingBottomChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssPaddingBottom := TBCssPaddingBottom.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.CBCssBorderStyleChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssBorderStyle := CBCssBorderStyle.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssBorderColorChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssBorderColor := CBCssBorderColor.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.TBCssBorderWidthChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssBorderWidth := TBCssBorderWidth.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.CBCssBackgroundColor1Change(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssBackgroundColor1 := CBCssBackgroundColor1.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssBackgroundColor2Change(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssBackgroundColor2 := CBCssBackgroundColor2.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssBackgroundDirectionChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssBackgroundDirection := CBCssBackgroundDirection.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.CBCssFloatChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssFloat := CBCssFloat.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.TBAtribImagensHeightChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.aHeight := TBAtribImagensHeight.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.TBAtribImagensWidthChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.aWidth := TBAtribImagensWidth.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.CBCssTextAlignChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssTextAlign := CBCssTextAlign.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.EdAtribImagensLinkKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.aSrc := SemDelimitadores(EdAtribImagensLink.Text);
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.EdAtribAcoesTextoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.Html := SemDelimitadores(EdAtribAcoesTexto.Text);
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.EdAtribAcoesLinkKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.aHref := SemDelimitadores(EdAtribAcoesLink.Text);
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.EdAtribItemListaTextoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.Html := SemDelimitadores(EdAtribItemListaTexto.Text);
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.TBCssBorderRadiusChange(Sender: TObject);
begin
  if (GetKeyState(VK_LBUTTON) and $8000) = 0 then
    if Assigned(InfosSelecionadas) then
    begin
      InfosSelecionadas.cssBorderRadius := TBCssBorderRadius.Position;
      IntervaloParaAtualizarHTML;
    end;
end;

procedure TFEditorHTML.CBCssListDtyleTypeChange(Sender: TObject);
begin
  if Assigned(InfosSelecionadas) then
    InfosSelecionadas.cssListStyleType := CBCssListDtyleType.Text;
  IntervaloParaAtualizarHTML;
end;

procedure TFEditorHTML.AdicionaArtigoSimples(Subtextos : Integer; Alinhamento : String; Vezes : Integer);
var
  x, y : Integer;
  wAlign : String;
  wNode, wNode2, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    if Alinhamento = 'Esquerda' then
      wAlign := 'Left'
    else if Alinhamento = 'Meio' then
      wAlign := 'Center'
    else if Alinhamento = 'Direita' then
      wAlign := 'Right';

    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','row')
    );
    wFirst := wNode;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','container')
    );
    TObjetoHTML(wNode.Data).cssTextAlign := wAlign;
    TObjetoHTML(wNode.Data).cssPaddingTop := 5;
    TObjetoHTML(wNode.Data).cssPaddingBottom := 5;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Grande',
      TObjetoHTML.Create(Sequencia,'h2','Insira um título')
    );

    wNode := TVNavegacao.Items.AddObject(
      wNode,
      'Tabela',
      TObjetoHTML.Create(Sequencia,'table')
    );
    TObjetoHTML(wNode.Data).cssWidth := 100;
    TObjetoHTML(wNode.Data).cssTextAlign := wAlign;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Linha',
      TObjetoHTML.Create(Sequencia,'tr')
    );

    for y := 1 to Subtextos do
    begin
      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Parágrafo',
        TObjetoHTML.Create(Sequencia,'p','Insira uma descrição')
      );
    end;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

procedure TFEditorHTML.AdicionaTabelaPersonalizada(Linhas, Colunas : Integer; Vezes : Integer);
var
  x, y, z : Integer;
  wNode, wNode2, wNode3, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Tabela',
      TObjetoHTML.Create(Sequencia,'table')
    );
    TObjetoHTML(wNode.Data).cssWidth := 100;
    wFirst := wNode;

    for y := 1 to Linhas do
    begin
      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Linha',
        TObjetoHTML.Create(Sequencia,'tr')
      );

      for z := 1 to Colunas do
      begin
        wNode3 := TVNavegacao.Items.AddChildObject(
          wNode2,
          'Coluna',
          TObjetoHTML.Create(Sequencia,'td')
        );

        TVNavegacao.Items.AddChildObject(
          wNode3,
          'Parágrafo',
          TObjetoHTML.Create(Sequencia,'p','Item')
        );
      end;
    end;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

procedure TFEditorHTML.AdicionaCartaoInformativo(LadoImagem : String; Vezes : Integer);
var
  x : Integer;
  wAlign : String;
  wNode, wNode2, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    if LadoImagem = 'Esquerda' then
      wAlign := 'Left'
    else if LadoImagem = 'Direita' then
      wAlign := 'Right';

    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','row')
    );
    wFirst := wNode;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Tabela',
      TObjetoHTML.Create(Sequencia,'table')
    );
    TObjetoHTML(wNode.Data).cssWidth := 100;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Linha',
      TObjetoHTML.Create(Sequencia,'tr')
    );

    if wAlign = 'Right' then
    begin
      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );
      TObjetoHTML(wNode2.Data).cssTextAlign := wAlign;

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Grande',
        TObjetoHTML.Create(Sequencia,'h2','Insira um titulo')
      );

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Parágrafo',
        TObjetoHTML.Create(Sequencia,'p','Insira um subtitulo que deseja')
      );

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );
      TObjetoHTML(wNode2.Data).cssPaddingLeft := 16;
      TObjetoHTML(wNode2.Data).cssPaddingTop := 3;
      TObjetoHTML(wNode2.Data).cssPaddingBottom := 3;
      TObjetoHTML(wNode2.Data).cssTextAlign := wAlign;

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img','','','https://www.w3schools.com/bootstrap4/paris.jpg')
      );
      TObjetoHTML(wNode2.Data).aHeight := 160;
    end
    else
    begin
      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );
      TObjetoHTML(wNode2.Data).cssPaddingLeft := 16;
      TObjetoHTML(wNode2.Data).cssPaddingTop := 3;
      TObjetoHTML(wNode2.Data).cssPaddingBottom := 3;
      TObjetoHTML(wNode2.Data).cssTextAlign := wAlign;

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img','','','https://www.w3schools.com/bootstrap4/paris.jpg')
      );
      TObjetoHTML(wNode2.Data).aHeight := 160;

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );
      TObjetoHTML(wNode2.Data).cssTextAlign := wAlign;

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Grande',
        TObjetoHTML.Create(Sequencia,'h2','Insira um titulo')
      );

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Parágrafo',
        TObjetoHTML.Create(Sequencia,'p','Insira um subtitulo que deseja')
      );
    end;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

procedure TFEditorHTML.AdicionaExposicaoDeProdutos(Produtos : Integer; MostrarPreco : Boolean; Vezes : Integer);
var
  x, y : Integer;
  wNode, wNode2, wNode3, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','row')
    );
    wFirst := wNode;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','container')
    );
    TObjetoHTML(wNode.Data).cssPaddingTop := 3;
    TObjetoHTML(wNode.Data).cssPaddingBottom := 2;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Centralizador',
      TObjetoHTML.Create(Sequencia,'center')
    );

    TVNavegacao.Items.AddChildObject(
      wNode,
      'Grande',
      TObjetoHTML.Create(Sequencia,'h2','Insira um título')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Tabela',
      TObjetoHTML.Create(Sequencia,'table')
    );
    TObjetoHTML(wNode.Data).cssMarginTop := 3;
    TObjetoHTML(wNode.Data).cssWidth := Round(33.3*Produtos);

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Linha',
      TObjetoHTML.Create(Sequencia,'tr')
    );

    for y := 1 to Produtos do
    begin
      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      ); 
      TObjetoHTML(wNode2.Data).cssWidth := 23;
      TObjetoHTML(wNode2.Data).cssPaddingRight := 4;
      TObjetoHTML(wNode2.Data).cssPaddingLeft := 4;

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Médio',
        TObjetoHTML.Create(Sequencia,'h3','Produto')
      );

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Centralizador',
        TObjetoHTML.Create(Sequencia,'center')
      );

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode3,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img','','','https://www.w3schools.com/bootstrap4/sanfran.jpg')
      );
      TObjetoHTML(wNode3.Data).aHeight := 85;
      TObjetoHTML(wNode3.Data).cssMarginTop := 2;

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Quebra de linha',
        TObjetoHTML.Create(Sequencia,'br')
      );

      if MostrarPreco then
      begin
        TVNavegacao.Items.AddChildObject(
          wNode2,
          'Médio',
          TObjetoHTML.Create(Sequencia,'h3','R$0,00')
        );
      end;

      TVNavegacao.Items.AddChildObject(
        wNode2,
        'Parágrafo',
        TObjetoHTML.Create(Sequencia,'p','Descrição')
      );

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Não ordenada',
        TObjetoHTML.Create(Sequencia,'ul')
      );

      TVNavegacao.Items.AddChildObject(
        wNode3,
        'Item',
        TObjetoHTML.Create(Sequencia,'li','Especifique')
      );

      TVNavegacao.Items.AddChildObject(
        wNode3,
        'Item',
        TObjetoHTML.Create(Sequencia,'li','Especifique')
      );

      TVNavegacao.Items.AddChildObject(
        wNode3,
        'Item',
        TObjetoHTML.Create(Sequencia,'li','Especifique')
      );
    end;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

procedure TFEditorHTML.AdicionaFelizAniversario(CorDaLetra : String ; Vezes : Integer);
var
  x : Integer;
  wAlign : String;
  wNode, wNode2, wNode3, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','row')
    );
    wFirst := wNode;
    TObjetoHTML(wNode.Data).cssMarginTop := 4;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','container')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Grande',
      TObjetoHTML.Create(Sequencia,'h2','Felicidades!')
    );
    TObjetoHTML(wNode.Data).cssColor := CorDaLetra;

    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','row')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','container')
    );

    TVNavegacao.Items.AddChildObject(
      wNode,
      'Parágrafo',
      TObjetoHTML.Create(Sequencia,'p','Parabéns pelo seu aniversário!')
    );

    TVNavegacao.Items.AddChildObject(
      wNode,
      'Parágrafo',
      TObjetoHTML.Create(Sequencia,'p','Que todos os seus sonhos sejam realizados. Que sua esperança seja sempre renovada e que neste dia você saiba, o quanto faz feliz as pessoas que estão ao seu lado.')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Parágrafo',
      TObjetoHTML.Create(Sequencia,'p','São os votos da equipe Developers Copyright!!!')
    );
    TObjetoHTML(wNode.Data).cssColor := CorDaLetra;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

procedure TFEditorHTML.AdicionaRodape(ComRedes : Boolean; Fundo : String; Vezes : Integer);
var
  x : Integer;
  wAlign : String;
  wNode, wNode2, wNode3, wNode4, wFirst : TTreeNode;
begin
  for x := 1 to Vezes do
  begin
    wNode := TVNavegacao.Items.AddChildObject(
      TVNavegacao.Items.GetFirstNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','Jumbotron')
    );
    wFirst := wNode;
    TObjetoHTML(wNode.Data).cssMarginTop := 5;
    TObjetoHTML(wNode.Data).cssBackgroundColor1 := Fundo;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','Row')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','Col')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Divisão',
      TObjetoHTML.Create(Sequencia,'div','','Container')
    );
    TObjetoHTML(wNode.Data).cssPaddingTop := 3;
    TObjetoHTML(wNode.Data).cssPaddingBottom := 3;

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Tabela',
      TObjetoHTML.Create(Sequencia,'table')
    );
    TObjetoHTML(wNode.Data).cssWidth := 100;

    wNode4 := TVNavegacao.Items.AddChildObject(
      wNode,
      'Linha',
      TObjetoHTML.Create(Sequencia,'tr')
    );

    wNode3 := TVNavegacao.Items.AddChildObject(
      wNode4,
      'Coluna',
      TObjetoHTML.Create(Sequencia,'td')
    );
    TObjetoHTML(wNode3.Data).cssTextAlign := 'center';

    wNode := TVNavegacao.Items.AddChildObject(
      wNode3,
      'Fonte',
      TObjetoHTML.Create(Sequencia,'img')
    );
    TObjetoHTML(wNode.Data).aSrc := 'https://images.koji-cdn.com/f0bb4ea3-93ad-451f-86df-f3ca66072917/q9zg0-YOURLOGOHERE256.png';
    TObjetoHTML(wNode.Data).aWidth := 115;

    wNode3 := TVNavegacao.Items.AddChildObject(
      wNode4,
      'Coluna',
      TObjetoHTML.Create(Sequencia,'td')
    );

    wNode2 := TVNavegacao.Items.AddChildObject(
      wNode3,
      'Não ordenada',
      TObjetoHTML.Create(Sequencia,'ul')
    );
    TObjetoHTML(wNode2.Data).cssListStyleType := 'None';

    wNode := TVNavegacao.Items.AddChildObject(
      wNode2,
      'Item',
      TObjetoHTML.Create(Sequencia,'li','Links')
    );
    if Fundo = 'Branco' then
      TObjetoHTML(wNode.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode.Data).cssColor := 'Branco';
    TObjetoHTML(wNode.Data).cssFontWeight := 'Bold';

    wNode3 := TVNavegacao.Items.AddChildObject(
      wNode2,
      'Item',
      TObjetoHTML.Create(Sequencia,'li')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode3,
      'Link',
      TObjetoHTML.Create(Sequencia,'a','Home')
    );
    TObjetoHTML(wNode.Data).aHref := 'http://seusite.com.br';
    if Fundo = 'white' then
      TObjetoHTML(wNode.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode.Data).cssColor := 'Branco';
       
    wNode := TVNavegacao.Items.AddChildObject(
      wNode2,
      'Item',
      TObjetoHTML.Create(Sequencia,'li')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Link',
      TObjetoHTML.Create(Sequencia,'a','Downloads')
    );
    TObjetoHTML(wNode.Data).aHref := 'http://seusite.com';
    if Fundo = 'white' then
      TObjetoHTML(wNode.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode.Data).cssColor := 'Branco';

    wNode := TVNavegacao.Items.AddChildObject(
      wNode4,
      'Coluna',
      TObjetoHTML.Create(Sequencia,'td')
    );

    wNode := TVNavegacao.Items.AddChildObject(
      wNode,
      'Não ordenada',
      TObjetoHTML.Create(Sequencia,'ul')
    );
    TObjetoHTML(wNode.Data).cssListStyleType := 'None';

    wNode2 := TVNavegacao.Items.AddChildObject(
      wNode,
      'Item',
      TObjetoHTML.Create(Sequencia,'li','Contato')
    );
    if Fundo = 'white' then
      TObjetoHTML(wNode2.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode2.Data).cssColor := 'Branco';
    TObjetoHTML(wNode2.Data).cssFontWeight := 'Bold';

    wNode2 := TVNavegacao.Items.AddChildObject(
      wNode,
      'Item',
      TObjetoHTML.Create(Sequencia,'li','Avenida Brasilia, 2755')
    );
    if Fundo = 'white' then
      TObjetoHTML(wNode2.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode2.Data).cssColor := 'Branco';

    wNode2 := TVNavegacao.Items.AddChildObject(
      wNode,
      'Item',
      TObjetoHTML.Create(Sequencia,'li','Bairro: Centro')
    );

    if Fundo = 'white' then
      TObjetoHTML(wNode2.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode2.Data).cssColor := 'Branco';

    wNode2 := TVNavegacao.Items.AddChildObject(
      wNode,
      'Item',
      TObjetoHTML.Create(Sequencia,'li','Telefone: (45)3264-8888')
    );
    if Fundo = 'white' then
      TObjetoHTML(wNode2.Data).cssColor := 'Preto'
    else
      TObjetoHTML(wNode2.Data).cssColor := 'Branco';

    if ComRedes then
    begin
      wNode := TVNavegacao.Items.AddChildObject(
        wNode4,
        'Coluna',
        TObjetoHTML.Create(Sequencia,'td')
      );

      wNode := TVNavegacao.Items.AddChildObject(
        wNode,
        'Não ordenada',
        TObjetoHTML.Create(Sequencia,'ul')
      );
      TObjetoHTML(wNode.Data).cssListStyleType := 'None';

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Item',
        TObjetoHTML.Create(Sequencia,'li','Acesse:')
      );
      if Fundo = 'white' then
        TObjetoHTML(wNode2.Data).cssColor := 'Preto'
      else
        TObjetoHTML(wNode2.Data).cssColor := 'Branco';
      TObjetoHTML(wNode2.Data).cssFontWeight := 'Bold';

      wNode2 := TVNavegacao.Items.AddChildObject(
        wNode,
        'Item',
        TObjetoHTML.Create(Sequencia,'li')
      );
      TObjetoHTML(wNode2.Data).cssMarginTop := 4;

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Link',
        TObjetoHTML.Create(Sequencia,'a')
      );
      TObjetoHTML(wNode3.Data).aHref := 'http://facebook.com.br';

      wNode4 := TVNavegacao.Items.AddChildObject(
        wNode3,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img')
      );
      TObjetoHTML(wNode4.Data).aSrc := 'http://icons.iconarchive.com/icons/danleech/simple/32/facebook-icon.png';
      TObjetoHTML(wNode4.Data).aWidth := 28;

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Link',
        TObjetoHTML.Create(Sequencia,'a')
      );
      TObjetoHTML(wNode3.Data).aHref := 'http://twitter.com';

      wNode4 := TVNavegacao.Items.AddChildObject(
        wNode3,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img')
      );
      TObjetoHTML(wNode4.Data).aSrc := 'http://icons.iconarchive.com/icons/danleech/simple/32/twitter-icon.png';
      TObjetoHTML(wNode4.Data).aWidth := 28;
      TObjetoHTML(wNode4.Data).cssMarginLeft := 13;

      wNode3 := TVNavegacao.Items.AddChildObject(
        wNode2,
        'Link',
        TObjetoHTML.Create(Sequencia,'a')
      );
      TObjetoHTML(wNode3.Data).aHref := 'http://instagram.com';

      wNode4 := TVNavegacao.Items.AddChildObject(
        wNode3,
        'Fonte',
        TObjetoHTML.Create(Sequencia,'img')
      );
      TObjetoHTML(wNode4.Data).aSrc := 'http://icons.iconarchive.com/icons/designbolts/free-instagram/32/Active-Instagram-3-icon.png';
      TObjetoHTML(wNode4.Data).aWidth := 28;
      TObjetoHTML(wNode4.Data).cssMarginLeft := 13;
    end;
  end;

  wFirst.Selected := True;
  wFirst.Expand(True);
  AtualizaHTML;
end;

end.
