unit UGuiaTransito_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFGuiaTransito_Cons = class(TFTConsulta)
    MeDtFim: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaTransito_Cons: TFGuiaTransito_Cons;

implementation

uses UGuiaTransito_cl;

{$R *.dfm}

procedure TFGuiaTransito_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMGuiaTransito.QGuiaTransito_Cons.Close;
  DMGuiaTransito.QGuiaTransito_Cons.SetVariable('Dt_Inicio',StrToDate(METexto.Text));
  DMGuiaTransito.QGuiaTransito_Cons.SetVariable('Dt_Fim',StrToDate(MEDtFim.Text));
  DMGuiaTransito.QGuiaTransito_Cons.Open;
end;

procedure TFGuiaTransito_Cons.FormActivate(Sender: TObject);
begin
  inherited;
  MeTexto.Text := DateToStr(Date);
  MeDtFim.Text := DateToStr(Date);
end;

end.
