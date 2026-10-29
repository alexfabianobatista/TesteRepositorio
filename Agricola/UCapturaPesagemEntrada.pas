unit UCapturaPesagemEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_Video, StdCtrls, Buttons, ExtCtrls;

type
  TFCapturaPesagemEntrada = class(TForm)
    Frame_Video1: TFrame1;
    Frame_Video2: TFrame1;
    Panel2: TPanel;
    btnCapturar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Frame_Video1SpeedButton_RunVideoClick(Sender: TObject);
    procedure Frame_Video1SpeedButton_StopClick(Sender: TObject);
    procedure Frame_Video2SpeedButton_StopClick(Sender: TObject);
    procedure Frame_Video2SpeedButton_RunVideoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCapturaPesagemEntrada: TFCapturaPesagemEntrada;

implementation

{$R *.dfm}

procedure TFCapturaPesagemEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Frame_Video1.SpeedButton_StopClick(Sender);
  Frame_video2.SpeedButton_StopClick(Sender);
  Frame_Video1.Close;
  Frame_Video2.Close;
end;

procedure TFCapturaPesagemEntrada.FormShow(Sender: TObject);
begin
 // Frame_Video2.Label_Cameras.Caption := 'Camera #2';
  {Frame_Video2.InitFrame;
  Frame_Video1.InitFrame;
  Frame_Video2.ComboBox_Cams.ItemIndex := 1;
  Frame_Video1.ComboBox_Cams.ItemIndex := 0;
  Frame_Video2.SpeedButton_RunVideoClick(Sender);
  Frame_Video1.SpeedButton_RunVideoClick(Sender);}
end;

procedure TFCapturaPesagemEntrada.Frame_Video1SpeedButton_RunVideoClick(
  Sender: TObject);
begin
  Frame_Video1.SpeedButton_RunVideoClick(Sender);

end;

procedure TFCapturaPesagemEntrada.Frame_Video1SpeedButton_StopClick(
  Sender: TObject);
begin
  Frame_Video1.SpeedButton_StopClick(Sender);

end;

procedure TFCapturaPesagemEntrada.Frame_Video2SpeedButton_StopClick(
  Sender: TObject);
begin
  Frame_Video2.SpeedButton_StopClick(Sender);

end;

procedure TFCapturaPesagemEntrada.Frame_Video2SpeedButton_RunVideoClick(
  Sender: TObject);
begin
  Frame_Video2.SpeedButton_RunVideoClick(Sender);

end;

procedure TFCapturaPesagemEntrada.FormCreate(Sender: TObject);
begin
  {Frame_Video2.InitFrame;
  Frame_Video1.InitFrame;
  Frame_Video2.ComboBox_Cams.ItemIndex := 1;
  Frame_Video1.ComboBox_Cams.ItemIndex := 0;
//  Sleep(5000);
  Frame_Video2.SpeedButton_RunVideoClick(Sender);
  Frame_Video1.SpeedButton_RunVideoClick(Sender);}
end;

procedure TFCapturaPesagemEntrada.FormActivate(Sender: TObject);
begin
  Frame_Video2.InitFrame;
  Frame_Video1.InitFrame;
  Frame_Video2.ComboBox_Cams.ItemIndex := 1;
  Frame_Video1.ComboBox_Cams.ItemIndex := 0;
//  Sleep(5000);
  Frame_Video2.SpeedButton_RunVideoClick(Sender);
  Frame_Video1.SpeedButton_RunVideoClick(Sender);
end;

end.
