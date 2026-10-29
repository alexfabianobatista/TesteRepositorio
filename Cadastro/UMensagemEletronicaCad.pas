unit UMensagemEletronicaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, OleCtrls, SHDocVw, DBPanel, DBCtrls, ActiveX, ClipBrd, UBiblioteca;

type
  TFMensagemEletronicaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBPanel1: TDBPanel;
    DBPDescricao: TDBPanel;
    DBPTitulo: TDBPanel;
    DBPRemetente: TDBPanel;
    DBMemoCorpo: TDBMemo;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    BtSelecionarTudo: TButton;
    BtApagar: TButton;
    BtCopiar: TButton;
    BtColar: TButton;
    BtnEditar: TBitBtn;
    Memo3: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string) ;
    procedure SBConfirmarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtColarClick(Sender: TObject);
    procedure BtSelecionarTudoClick(Sender: TObject);
    procedure BtApagarClick(Sender: TObject);
    procedure BtCopiarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBMemoCorpoChange(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemEletronicaCad: TFMensagemEletronicaCad;

implementation
         
uses UMalaDireta_cl, UTela_cl, UMensagemEletronicaCons, UOracle_cl,
  UEditorHTML;

{$R *.dfm}

procedure TFMensagemEletronicaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMalaDireta.QMensagemEletronica.Open;
  DMTela.VerificaTela('CADASTRO', Self.Caption, Self.Name);
end;

procedure TFMensagemEletronicaCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

  Bib.addControleCharCase(DBPDescricao, Self.Name);
  Bib.addControleCharCase(DBPTitulo, Self.Name);
  Bib.addControleCharCase(DBPRemetente, Self.Name);

  if FEditorHTML = nil then
    FEditorHTML := TFEditorHTML.Create(Application);
end; 

procedure TFMensagemEletronicaCad.BtnEditarClick(Sender: TObject);
begin
  inherited;
  with DMMalaDireta do
  begin
    FEditorHTML.CarregarEdicao;
    FEditorHTML.ShowModal;

    if FEditorHTML.ModalResult = mrOk then
    begin
      QMensagemEletronicaBACKUP_ALTERACAO.LoadFromStream(FEditorHTML.EdicaoStream);
      QMensagemEletronicaDESC_CORPO.Value := '<html>' + FEditorHTML.HeadHTML +  FEditorHTML.CorpoHTMLFinal + '</html>';
      WBLoadHTML(WebBrowser1,DBMemoCorpo.Lines.Text);
    end;
  end;
end; 

procedure TFMensagemEletronicaCad.DSPrimarioStateChange(Sender: TObject);
var
  Buffer: PByte;
begin
  inherited;

  if (DSPrimario.State in [DsInsert]) and (Self.Visible) then
  begin
    DBPDescricao.SetFocus;
  end;

  with DMMalaDireta do
  begin
    if QMensagemEletronicaCOD_MENSAGEM_ELETRONICA.Value > 0 then
    begin
      FEditorHTML.EdicaoStream.Clear;
      QMensagemEletronicaBACKUP_ALTERACAO.SaveToStream(FEditorHTML.EdicaoStream);
    end;
  end; 

  BtApagar.Enabled := DSPrimario.State in [dsInsert, dsEdit];
  BtColar.Enabled := DSPrimario.State in [dsInsert, dsEdit];
  BtnEditar.Enabled := DSPrimario.State in [dsInsert, dsEdit];
end;

procedure TFMensagemEletronicaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMensagemEletronicaCons = nil then
    FMensagemEletronicaCons := TFMensagemEletronicaCons.Create(Application);
  if FMensagemEletronicaCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMMalaDireta.QMensagemEletronicaConsCOD_MENSAGEM_ELETRONICA.Text;
    MELocalizaExit(Sender);
  end;
end;

procedure TFMensagemEletronicaCad.WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string) ;
var
   sl: TStringList; 
   ms: TMemoryStream; 
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do 
    Application.ProcessMessages; 
 
   if Assigned(WebBrowser.Document) then
   begin 
     sl := TStringList.Create; 
     try 
       ms := TMemoryStream.Create; 
       try 
         sl.Text := HTMLCode; 
         sl.SaveToStream(ms) ; 
         ms.Seek(0, 0) ; 
         (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ; 
       finally 
         ms.Free; 
       end; 
     finally 
       sl.Free; 
     end; 
   end; 
end;

procedure TFMensagemEletronicaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFMensagemEletronicaCad.FormShow(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsInsert] then
  begin
    DBPDescricao.SetFocus;
  end;
end;

procedure TFMensagemEletronicaCad.BtColarClick(Sender: TObject);
begin
  inherited;
  DBMemoCorpo.SelText := Clipboard.AsText;
end;

procedure TFMensagemEletronicaCad.BtSelecionarTudoClick(Sender: TObject);
begin
  inherited;
  DBMemoCorpo.SelectAll;
  DBMemoCorpo.SetFocus;
end;

procedure TFMensagemEletronicaCad.BtApagarClick(Sender: TObject);
begin
  inherited;
  DBMemoCorpo.SelText := '';
end;

procedure TFMensagemEletronicaCad.BtCopiarClick(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := DBMemoCorpo.SelText;
end;

procedure TFMensagemEletronicaCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePageIndex = 0 then
      WBLoadHTML(WebBrowser1,DBMemoCorpo.Lines.Text);
end;

procedure TFMensagemEletronicaCad.DBMemoCorpoChange(Sender: TObject);
begin
  inherited;
  WBLoadHTML(WebBrowser1,DBMemoCorpo.Lines.Text);
end;

end.
