unit UTipoMovimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls;

type
  TFTipoMovimentoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoMovimentoCad: TFTipoMovimentoCad;

implementation

uses UTipoMovimento_cl, UTipoMovimentoCons;

{$R *.DFM}

procedure TFTipoMovimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTipoMovimento.QTipoMovimento.Open;
end;

procedure TFTipoMovimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoMovimentoCons=Nil then
    FTipoMovimentoCons:=TFTipoMovimentoCons.Create(Application);
  If FTipoMovimentoCons.ShowModal=mrOk then
    Begin
      With DMTipoMovimento do
        Begin
          QTipoMovimento.Close;
          QTipoMovimento.ParamByName('PK').AsFloat:=QTipoMovimentoConsCod_Tipo_Movimento.value;
          QTipoMovimento.Open;
        End;
    End;
end;

end.
