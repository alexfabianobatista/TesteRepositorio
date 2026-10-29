unit UExcluiMovVend_Ant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, Buttons;

type
  TFExcluiMovVend_Ant = class(TForm)
    DSPrimario: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExcluiMovVend_Ant: TFExcluiMovVend_Ant;

implementation

uses Ucontrato_cl, UOracle_cl;

{$R *.DFM}

procedure TFExcluiMovVend_Ant.FormActivate(Sender: TObject);
begin
  DMContrato.QContrato_VendMovDeleta.Open;
end;

procedure TFExcluiMovVend_Ant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMContrato.QContrato_VendMovDeleta.Close;
end;

procedure TFExcluiMovVend_Ant.Button1Click(Sender: TObject);
begin
  if DSPrimario.DataSet.RecordCount>0 then
    begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.SetVariable('PK',DMCOntrato.QContrato_VendMovDeletaCOD_CONTRATO_VEND.Value);
        DMContrato.QContrato_Vend.Open;
        DMContrato.QContrato_Vend.Edit;
        DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value + DMCOntrato.QContrato_VendMovDeletaQT_QUANTIDADE.Value;
        DMContrato.QContrato.Edit;
        DMContrato.QContratoQTDE_SALDO.Value:=DMContrato.QContratoQTDE_SALDO.Value+DMCOntrato.QContrato_VendMovDeletaQT_QUANTIDADE.Value;
        If DMContrato.QContratoQTDE_SALDO.Value < 0 then
           DMContrato.QContratoQTDE_SALDO.Value := 0;
        DMContrato.QContrato.Post;
        DMContrato.QContrato_Vend.Post;
        DSPrimario.DataSet.Delete;
        DMOracle.DBCemapa.Commit;
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.Open;
      except
        DMOracle.DBCemapa.RollBack;
      end;
    end;
end;

end.
