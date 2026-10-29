unit UPreVisualizacaoDFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls,
  StdCtrls, Buttons;

type
  TFPreVisualizacaoDFe = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtCancelaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPreVisualizacaoDFe: TFPreVisualizacaoDFe;
  botaoClicado: Boolean;

implementation

uses Math;

{$R *.dfm}

procedure TFPreVisualizacaoDFe.FormActivate(Sender: TObject);
begin
  botaoClicado := false;
  try
    WebBrowser1.Navigate('file://'+ExtractFilePath(Application.ExeName)+ 'Previsualiza.pdf');
  except

  end;
end;

procedure TFPreVisualizacaoDFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    if not botaoClicado then
      if MessageDlg('Deseja prosseguir com a emissão?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
        ModalResult := mrOk;
    WebBrowser1.Free;
    DeleteFile(ExtractFilePath(Application.ExeName)+ 'Previsualiza.pdf');
  except
  end;
end;

procedure TFPreVisualizacaoDFe.BtCancelaClick(Sender: TObject);
begin
  botaoClicado := true;
end;

procedure TFPreVisualizacaoDFe.BtOkClick(Sender: TObject);
begin
  botaoClicado := true;
end;

end.
