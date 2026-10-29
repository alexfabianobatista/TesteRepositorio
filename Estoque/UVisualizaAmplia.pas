unit UVisualizaAmplia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, ExtCtrls, StdCtrls, jpeg, UProduto_cl, DB;

type
  TFVisualizaAmplia = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    EdtPerc: TEdit;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
FVisualizaAmplia: TFVisualizaAmplia;

implementation

{$R *.dfm}


procedure TFVisualizaAmplia.Button1Click(Sender: TObject);
begin

  Image1.Height := Image1.Height + StrToInt(EdtPerc.Text);
  Image1.Width := Image1.Width + StrToInt(EdtPerc.Text);

  // Isso é para ir dando zoom pelo centro da imagem
  Image1.Top := Image1.Top - Trunc(StrToInt(EdtPerc.Text)/2);
  Image1.Left := Image1.Left - Trunc(StrToInt(EdtPerc.Text)/2);

end;

procedure TFVisualizaAmplia.Button2Click(Sender: TObject);
begin

  Image1.Height := Image1.Height - StrToInt(EdtPerc.Text);
  Image1.Width := Image1.Width - StrToInt(EdtPerc.Text);

  Image1.Top := Image1.Top + Trunc(StrToInt(EdtPerc.Text)/2);
  Image1.Left := Image1.Left + Trunc(StrToInt(EdtPerc.Text)/2);

end;

procedure TFVisualizaAmplia.FormCreate(Sender: TObject);
var
  Stream: TMemoryStream;
  Jpg: TJPEGImage;
begin

 with DMProduto do
  begin
    if not (QImagem_Consulta.IsEmpty) and
        not (QImagem_ConsultaIMG_IMAGEM.IsNull) then
    begin
      Stream := TMemoryStream.Create;
      Jpg := TJPEGImage.Create;
      (QImagem_ConsultaIMG_IMAGEM as TBlobField).SaveToStream(Stream);
      Stream.Position := 0;
      Jpg.LoadFromStream(Stream);

      try
        image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
        Stream.Free;
      end;
    end
    else
      Image1.Free;

  end;
end;

procedure TFVisualizaAmplia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FVisualizaAmplia := nil;
end;

end.
