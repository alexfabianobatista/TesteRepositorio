unit UExcluiMovVend_Custos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, StdCtrls;

type
  TFExcluiMovVend_Custos = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DSPrimario: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExcluiMovVend_Custos: TFExcluiMovVend_Custos;

implementation

uses UContrato_Vend_Cl, UOracle_cl, Ucontrato_cl;

{$R *.DFM}

procedure TFExcluiMovVend_Custos.Button1Click(Sender: TObject);
begin
  if DSPrimario.DataSet.RecordCount>0 then
    begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.SetVariable('PK',DMContrato_Vend.QContrato_Vend_CustosCOD_CONTRATO_VEND.Value);
        DMContrato.QContrato_Vend.Open;
        If DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value = 'F' Then
           Raise exception.Create('Contrato custo fechado');
        DMContrato.QContrato_Vend.Edit;
        DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value + DMContrato_Vend.QContrato_Vend_Custos_ExcluiQT_QUANTIDADE.Value;
        DMContrato_Vend.QContrato_Vend_Custos.Edit;
        DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value:=DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value+DMContrato_Vend.QContrato_Vend_Custos_ExcluiQT_QUANTIDADE.Value;
        DMContrato.QContrato_Vend.Post;
        DMContrato_Vend.QContrato_Vend_CustosCod_Contrato_Vend.Text := '';
        DMContrato_Vend.QContrato_Vend_Custos.Post;
        DSPrimario.DataSet.Delete;
        DMOracle.DBCemapa.Commit;
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.Open;
      except
        If DMContrato.QContrato_Vend.State In [DsInsert,DsEdit] Then
           DMContrato.QContrato_Vend.Cancel;
        DMOracle.DBCemapa.RollBack;
        Raise;
      end;
    end;
end;

procedure TFExcluiMovVend_Custos.FormActivate(Sender: TObject);
begin
  DMContrato_Vend.QContrato_Vend_Custos_Exclui.Open;
end;

procedure TFExcluiMovVend_Custos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMContrato_Vend.QContrato_Vend_Custos_Exclui.Close;
end;

end.
