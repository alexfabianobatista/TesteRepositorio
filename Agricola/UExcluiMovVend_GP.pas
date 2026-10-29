unit UExcluiMovVend_GP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, Buttons, StdCtrls;

type
  TFExcluiMovVend_GP = class(TForm)
    DSPrimario: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExcluiMovVend_GP: TFExcluiMovVend_GP;

implementation

uses Ucontrato_cl, UOracle_cl;

{$R *.DFM}

procedure TFExcluiMovVend_GP.Button1Click(Sender: TObject);
begin
  if DSPrimario.DataSet.RecordCount>0 then
    begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.SetVariable('PK',DMCOntrato.QContrato_VendMovDeleta_GPCOD_CONTRATO_VEND.Value);
        DMContrato.QContrato_Vend.Open;
        DMContrato.QContrato_Vend.Edit;
        DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value + DMCOntrato.QContrato_VendMovDeleta_GPQT_QUANTIDADE.Value;
        DMContrato.QContrato_Vend.Post;
        DMContrato.QContrato_GP.Edit;
        If DMContrato.QContrato_VendMovDeleta_GPQT_QUANTIDADE.Value > 0 Then
           DMContrato.QContrato_GPQTDE_SALDO.Value:=DMContrato.QContrato_GPQTDE_SALDO.Value+DMContrato.QContrato_VendMovDeleta_GPQT_QUANTIDADE.Value;
        DMContrato.QContrato_GP.Post;
        If DMContrato.QContrato_VendMovDeleta_GPCod_Contrato_Gp.Text <> '' Then
         Begin
           DMOracle.QExecSQL.Close;
           DMOracle.QExecSQL.SQL.Clear;
           DMOracle.QExecSQL.SQL.Add('UPDATE TB_CONTRATO_GP_MOV SET IND_APLICADO_AJUSTE = ' + chr(39) + 'NAO' + chr(39));
           DMOracle.QExecSQL.SQL.Add('WHERE COD_CONTRATO_GP_MOV = ' + DMContrato.QContrato_VendMovDeleta_GPCod_Contrato_Gp.Text);  // ESTA RELMENTE INVERTIDO OS CAMPOS IMPLANTADO DEPOIS ESTE CAMPO
           DMOracle.QExecSQL.ExecSQL;
         End;
        DSPrimario.DataSet.Delete;
        DMOracle.DBCemapa.Commit;
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.Open;
      except
        DMOracle.DBCemapa.RollBack;
      end;
    end;
end;

procedure TFExcluiMovVend_GP.FormActivate(Sender: TObject);
begin
  DMContrato.QContrato_VendMovDeleta_GP.Open;
end;

procedure TFExcluiMovVend_GP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMContrato.QContrato_VendMovDeleta_GP.Close;
end;

end.
