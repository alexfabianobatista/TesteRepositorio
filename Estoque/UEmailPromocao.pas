unit UEmailPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmProduto, DB, Grids, DBGrids, StdCtrls, Buttons, Mask,
  IdMessage, IdPOP3, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP;

type
  TFEmailPromocao = class(TForm)
    FmProduto: TFmProduto;
    Label1: TLabel;
    EPreco: TEdit;
    BtnAdicionar: TBitBtn;
    GbProdutos: TGroupBox;
    DbgProdutos: TDBGrid;
    DsEmail: TDataSource;
    Label55: TLabel;
    MeData: TMaskEdit;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    iSmtp: TIdSMTP;
    EEmail: TEdit;
    BtEmail: TBitBtn;
    MeEmail: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    ETitulo: TEdit;
    IdMessage1: TIdMessage;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure FmProdutoMeProdutoExit(Sender: TObject);
    procedure FmProdutoBtProdutoClick(Sender: TObject);
    procedure BtEmailClick(Sender: TObject);
    procedure MeEmailExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    function carregarArquivo(caminho: string): string;
    function substituiStr(entrada, origem, destino: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmailPromocao: TFEmailPromocao;

implementation

uses UProduto_cl, UOracle_cl, UEmailCons, UCadastro_cl, UBiblioteca,
  UUsuario_cl;

{$R *.dfm}

procedure TFEmailPromocao.BtnOKClick(Sender: TObject);
var
  wMensagem: TStrings;
  wHTML, wHTMLProdutoBase, wHTMLProduto, wHTMLListaProduto: string;
  wEmail: string;
  lImagePart: TIdAttachment;
  htmpart: TIdText;
  wHTMLStrings: TStrings;
  iMessage: TIdMessage;
  lTextPart: TIdText;
begin
  wEmail := DMOracle.BuscaNome('SELECT DESC_EMAIL FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));

  wHTML := carregarArquivo('C:\Layout\corpo_simples.html');
  wHTMLProdutoBase := carregarArquivo('C:\Layout\produto.html');
  wHTMLListaProduto := '';

  DMProduto.CdEmail.First;
  while not DMProduto.CdEmail.Eof do
  begin
    wHTMLProduto := wHTMLProdutoBase;
    wHTMLProduto := substituiStr(wHTMLProduto, '-%DESCRICAO%-', DMProduto.CdEmailDESC_PRODUTO.Value);
    wHTMLProduto := substituiStr(wHTMLProduto, '-%IMAGEM%-', 'cid:produto.JPG');
    wHTMLProduto := substituiStr(wHTMLProduto, '-%PRECO%-', FormatCurr('R$ #,###,###.00', DMProduto.CdEmailVAL_PRECO.Value));

    wHTMLListaProduto := wHTMLListaProduto + wHTMLProduto;

    DMProduto.CdEmail.Next;
  end;

  wHTML := substituiStr(wHTML, '-%DESC_FILIAL%-', DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario)));
  wHTML := substituiStr(wHTML, '-%PRODUTOS%-', wHTMLListaProduto);
  wHTML := substituiStr(wHTML, '-%VALIDADE%-', MeData.Text);
  wHTML := substituiStr(wHTML, '-%EMAIL_ORIGEM%-', wEmail);

  //////////////////////////////////////////////////////////////////////////////

  iSmtp.Host := DMOracle.BuscaNome('SELECT DESC_SMTP FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));
  iSmtp.Username := wEmail;
  iSmtp.Password := DMOracle.BuscaNome('SELECT DESC_SENHA FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));
  iSmtp.Port := StrToInt(DMOracle.BuscaNome('SELECT NUM_PORTA_SMTP FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text)));

  iSmtp.Connect;
  iSmtp.Authenticate;

  //////////////////////////////////////////////////////////////////////////////

  DMCadastro.QCadastroComEmail.Close;
  DMCadastro.QCadastroComEmail.Open;
  DMCadastro.QCadastroComEmail.First;

    iMessage := TIdMessage.Create(Self);
    iMessage.From.Address := wEmail;
    iMessage.Subject := ETitulo.Text;
    iMessage.CharSet := 'iso-8859-1';
    iMessage.From.Name := DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
    iMessage.Body.Clear;

    wHTMLStrings := TStringList.Create;
    wHTMLStrings.Text := wHTML;

    lTextPart := TIdText.Create(iMessage.MessageParts);
    lTextPart.Body.Text := 'Caso não consiga visualizar esta mensagem entre em contato com a ' + DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
    lTextPart.ContentType := 'text/plain';

    lTextPart := TIdText.Create(iMessage.MessageParts);
    lTextPart.Body := wHTMLStrings;
    lTextPart.ContentType := 'text/html';

    lImagePart := TIdAttachment.Create(iMessage.MessageParts, 'c:\produto.JPG');
    lImagePart.ContentType := 'image/jpg';
    lImagePart.Headers.Add('Content-ID: <produto.JPG>');

  while not DMCadastro.QCadastroComEmail.Eof do
  begin
    iMessage.BccList.Add.Address := DMCadastro.QCadastroComEmailDESC_E_MAIL.Value;

    DMCadastro.QCadastroComEmail.Next;
  end;

    try
      iSmtp.Send(iMessage);
    finally

    end;

  iSmtp.Disconnect;

  Application.MessageBox('E-Mails enviados com sucesso', 'Confirmação', MB_ICONINFORMATION + MB_OK);

//  wEmail := DMOracle.BuscaNome('SELECT DESC_EMAIL FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));
//
//  wHTML := carregarArquivo('C:\Layout\corpo_simples.html');
//  wHTMLProdutoBase := carregarArquivo('C:\Layout\produto.html');
//  wHTMLListaProduto := '';
//
//  DMProduto.CdEmail.First;
//  while not DMProduto.CdEmail.Eof do
//  begin
//    wHTMLProduto := wHTMLProdutoBase;
//    wHTMLProduto := substituiStr(wHTMLProduto, '-%DESCRICAO%-', DMProduto.CdEmailDESC_PRODUTO.Value);
//    wHTMLProduto := substituiStr(wHTMLProduto, '-%IMAGEM%-', 'cid:produto.JPG');
//    wHTMLProduto := substituiStr(wHTMLProduto, '-%PRECO%-', FormatCurr('R$ #,###,###.00', DMProduto.CdEmailVAL_PRECO.Value));
//
//    wHTMLListaProduto := wHTMLListaProduto + wHTMLProduto;
//
//    DMProduto.CdEmail.Next;
//  end;
//
//  wHTML := substituiStr(wHTML, '-%DESC_FILIAL%-', DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario)));
//  wHTML := substituiStr(wHTML, '-%PRODUTOS%-', wHTMLListaProduto);
//  wHTML := substituiStr(wHTML, '-%VALIDADE%-', MeData.Text);
//  wHTML := substituiStr(wHTML, '-%EMAIL_ORIGEM%-', wEmail);
//
//  //////////////////////////////////////////////////////////////////////////////
//
//  iSmtp.Host := DMOracle.BuscaNome('SELECT DESC_SMTP FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));
//  iSmtp.Username := wEmail;
//  iSmtp.Password := DMOracle.BuscaNome('SELECT DESC_SENHA FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text));
//  iSmtp.Port := StrToInt(DMOracle.BuscaNome('SELECT NUM_PORTA_SMTP FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text)));
//
//  iSmtp.Connect;
//  iSmtp.Authenticate;
//
//  //////////////////////////////////////////////////////////////////////////////
//
//  DMCadastro.QCadastroComEmail.Close;
//  DMCadastro.QCadastroComEmail.Open;
//  DMCadastro.QCadastroComEmail.First;
//
//  while not DMCadastro.QCadastroComEmail.Eof do
//  begin
//    wHTML := substituiStr(wHTML, '-%NOME%-', DMCadastro.QCadastroComEmailNOME.Value);
//
//    wHTMLStrings := TStringList.Create;
//    wHTMLStrings.Text := wHTML;
//
//    iMessage := TIdMessage.Create(Self);
//    iMessage.From.Address := wEmail;
//    iMessage.Subject := ETitulo.Text;
//    iMessage.Recipients.Add.Address := DMCadastro.QCadastroComEmailDESC_E_MAIL.Value;
//    iMessage.CharSet := 'iso-8859-1';
//    iMessage.From.Name := DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
//    iMessage.Body.Clear;
//
//    lTextPart := TIdText.Create(iMessage.MessageParts);
//    lTextPart.Body.Text := 'Caso não consiga visualizar esta mensagem entre em contato com a ' + DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
//    lTextPart.ContentType := 'text/plain';
//
//    lTextPart := TIdText.Create(iMessage.MessageParts);
//    lTextPart.Body := wHTMLStrings;
//    lTextPart.ContentType := 'text/html';
//
//    lImagePart := TIdAttachment.Create(iMessage.MessageParts, 'c:\produto.JPG');
//    lImagePart.ContentType := 'image/jpg';
//    lImagePart.Headers.Add('Content-ID: <produto.JPG>');
//
//    try
//      iSmtp.Send(iMessage);
//    finally
//
//    end;
//
//    DMCadastro.QCadastroComEmail.Next;
//  end;
//
//  iSmtp.Disconnect;
//
//  Application.MessageBox('E-Mails enviados com sucesso', 'Confirmação', MB_ICONINFORMATION + MB_OK);
end;

procedure TFEmailPromocao.FormCreate(Sender: TObject);
begin
  DMProduto.CdEmail.Close;
  DMProduto.CdEmail.Open;

  MeData.Text := DateToStr(Date);
end;

procedure TFEmailPromocao.BtnAdicionarClick(Sender: TObject);
begin
  DMProduto.CdEmail.Append;
  DMProduto.CdEmailCOD_PRODUTO.Text := FmProduto.MeProduto.Text;
  DMProduto.CdEmailDESC_PRODUTO.Text := FmProduto.EdProduto.Text;
  DMProduto.CdEmailVAL_PRECO.Value := StrToFloat(EPreco.Text);
  DMProduto.CdEmail.Post;

  FmProduto.MeProduto.Clear;
  FmProduto.EdProduto.Clear;
  EPreco.Clear;

  FmProduto.MeProduto.SetFocus;
end;

procedure TFEmailPromocao.FmProdutoMeProdutoExit(Sender: TObject);
begin
  FmProduto.MeProdutoExit(Sender);
  if Trim(FmProduto.MeProduto.Text) <> '' then
    EPreco.Text := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + Trim(FmProduto.MeProduto.Text));
end;

procedure TFEmailPromocao.FmProdutoBtProdutoClick(Sender: TObject);
begin
  FmProduto.BtProdutoClick(Sender);
end;

procedure TFEmailPromocao.BtEmailClick(Sender: TObject);
begin
  if FEmailCons = nil then
    FEmailCons := TFEmailCons.Create(Application);
  if FEmailCons.ShowModal = MrOk then
    MeEmail.Text := DMCadastro.QEmailConsCOD_EMAIL.Text;
  MeEmailExit(Self);
end;

procedure TFEmailPromocao.MeEmailExit(Sender: TObject);
begin
  if Trim(MeEmail.Text) <> '' then
    EEmail.Text := DMOracle.BuscaNome('SELECT DESC_EMAIL FROM TB_EMAIL', 'COD_EMAIL = ' + Trim(MeEmail.Text))
  else
    EEmail.Text := '';
end;

function TFEmailPromocao.carregarArquivo(caminho: string): string;
var
  arquivo: TStrings;
begin
  arquivo := TStringList.Create;
  arquivo.LoadFromFile(caminho);
  Result := arquivo.Text;
end;

function TFEmailPromocao.substituiStr(entrada, origem, destino: string): string;
var
  wTamentrada, wTamorigem: Integer;
  wNovaStr: string;
  i: Integer;
begin
  wTamentrada := Length(entrada);
  wTamorigem := Length(origem);

  wNovaStr := '';
  i := 1;
  while i < wTamentrada + 1 do
  begin
    if Copy(entrada, i, wTamorigem) = origem then
    begin
      wNovaStr := wNovaStr + destino;
      Inc(i, wTamorigem);
    end
    else
    begin
      wNovaStr := wNovaStr + Copy(entrada, i, 1);
      Inc(i);
    end
  end;

  Result := wNovaStr;
end;

procedure TFEmailPromocao.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
