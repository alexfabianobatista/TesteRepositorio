unit UViradaMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFViradaMes = class(TForm)
    MEAnoMes: TMaskEdit;
    MECodFilial: TMaskEdit;
    BtFilial: TBitBtn;
    MEFilial: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    procedure BtFilialClick(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViradaMes: TFViradaMes;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl;

{$R *.DFM}

procedure TFViradaMes.BtFilialClick(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOK then
    MECodFilial.text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFViradaMes.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    MEFilial.Text:='Todos';
end;

end.
