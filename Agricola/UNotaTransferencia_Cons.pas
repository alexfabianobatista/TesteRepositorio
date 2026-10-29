unit UNotaTransferencia_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFNotaTransferencia_Cons = class(TFTConsulta)
    Label2: TLabel;
    MeDtFinal: TMaskEdit;
    Label3: TLabel;
    MeFilial: TMaskEdit;
    RgSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaTransferencia_Cons: TFNotaTransferencia_Cons;

implementation

uses UNotaTransferenciaFixar_cl;


{$R *.DFM}

procedure TFNotaTransferencia_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMNotaTransferenciaFixar.QNotaTransferenciaCons.Close;
  If Trim(MeFilial.Text) <> ''  Then
     DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Cod_Filial',Trim(MeFilial.Text))
  Else
     DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Cod_Filial',Null);
  DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Dt_Inicio',MeTexto.Text);
  DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Dt_Fim',MeDtFinal.Text);
  Case RgSituacao.ItemIndex of
    0 : DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Ind_Situacao','1');
    1 : DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Ind_Situacao','2');
    2 : DMNotaTransferenciaFixar.QNotaTransferenciaCons.SetVariable('Ind_Situacao',Null);
  End;
  DMNotaTransferenciaFixar.QNotaTransferenciaCons.Open;
end;

procedure TFNotaTransferencia_Cons.FormActivate(Sender: TObject);
begin
  inherited;
  MeTexto.Text := DateToStr(Date);
  MeDtFinal.Text := DateToStr(Date);
end;

end.
