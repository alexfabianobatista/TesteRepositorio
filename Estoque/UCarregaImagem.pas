unit UCarregaImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, JPeg, IdHTTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, ExtDlgs, UBiblioteca;

type
  TFCarregaImagem = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CBItem: TComboBox;
    IMImagem: TImage;
    BtnOk: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure CBItemChange(Sender: TObject);   
    procedure GetImageByUrl(URL: string; APicture: TPicture);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    LinkImagem : String;
    LinkIntermediario : String;
    { Public declarations }
  end;

var
  FCarregaImagem: TFCarregaImagem;

implementation

uses UProdutoCons;

{$R *.dfm}

procedure TFCarregaImagem.CBItemChange(Sender: TObject);
begin
  if CBItem.Text = 'Link da internet' then
  begin
    LinkImagem := InputBox('Link da internet','Cole o link de sua imagem', '');

    if LinkImagem <> '' then
    begin
      Bib.GetImageByUrl(LinkIntermediario + LinkImagem, IMImagem.Picture);
      BtnOk.Enabled := True;
    end;

  end
  else if CBItem.Text = 'Arquivo no computador' then
  begin

    if OpenPictureDialog1.Execute then
    begin
      IMImagem.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      BtnOk.Enabled := True;
    end;

  end
  else if CBItem.Text = 'Produto cadastrado' then
  begin

    if FProdutoCons = nil then
      FProdutoCons := TFProdutoCons.Create(Application);
    FProdutoCons.ShowModal;

    if (FProdutoCons.ModalResult = mrOk) and (FProdutoCons.imgProduto.Picture <> nil) then
    begin
      IMImagem.Picture := FProdutoCons.imgProduto.Picture;
      BtnOk.Enabled := True;
    end;
    
  end
  else
  begin
    BtnOk.Enabled := False;
    IMImagem.Picture := nil;
  end;
end;

procedure TFCarregaImagem.GetImageByUrl(URL: string; APicture: TPicture);
var
  Jpeg: TJPEGImage;
  Strm: TMemoryStream;
  vIdHTTP : TIdHTTP;
begin
  Screen.Cursor := crHourGlass;
  Jpeg := TJPEGImage.Create;
  Strm := TMemoryStream.Create;
  vIdHTTP := TIdHTTP.Create(nil);
  try
    vIdHTTP.Get(LinkIntermediario + URL, Strm);
    if (Strm.Size > 0) then
    begin
      Strm.Position := 0;
      Jpeg.LoadFromStream(Strm);
      APicture.Assign(Jpeg);
    end;
  finally
    Strm.Free;
    Jpeg.Free;
    vIdHTTP.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFCarregaImagem.BtnOkClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

end.
