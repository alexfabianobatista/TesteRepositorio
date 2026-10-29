unit UPisCofinsP_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, Dialogs;

type
  TDmPisCofinsP = class(TDataModule)
    QReg010: TOracleDataSet1;
    QReg100: TOracleDataSet1;
    QReg200: TOracleDataSet1;
    QReg010COD_FILIAL: TIntegerField;
    QReg010CNPJ: TStringField;
    QReg100DT_INI: TDateTimeField;
    QReg100DT_FIN: TDateTimeField;
    QReg100COD_ATIV_ECON: TIntegerField;
    QReg100VL_EXC: TFloatField;
    QReg100VL_REC_TOT_EST: TFloatField;
    QReg100VL_REC_ATIV_ESTAB: TFloatField;
    QReg100VL_BC_CONT: TFloatField;
    QReg100ALIQ_CONT: TFloatField;
    QReg100VL_CONT_APU: TFloatField;
    CDS100: TClientDataSet;
    CDS100COD_FILIAL: TIntegerField;
    CDS100DT_INI: TDateField;
    CDS100DT_FIN: TDateTimeField;
    CDS100VL_REC_TOT_EST: TFloatField;
    CDS100COD_ATIV_ECON: TStringField;
    CDS100VL_REC_ATIV_ESTAB: TFloatField;
    CDS100ALIQ_CONT: TFloatField;
    DS100: TDataSource;
    CDS200: TClientDataSet;
    CDS200VL_TOT_CONT_APU: TFloatField;
    CDS200VL_TOT_CONT_DEV: TFloatField;
    CDS200COD_REC: TStringField;
    CDS200PER_REF: TStringField;
    DS200: TDataSource;
    CDS100vl_cont_apu: TFloatField;
    CDS100vl_bc_cont: TFloatField;
    procedure CDS100AfterInsert(DataSet: TDataSet);
    procedure CDS100CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    DtIni: TDateTime;
    DtFin: TDateTime;
  public
    { Public declarations }
    property pDtIni: TDateTime read DtIni write DtIni;
    property pDtFin: TDateTime read DtFin write DtFin;
  end;

var
  DmPisCofinsP: TDmPisCofinsP;
implementation

uses UOracle_cl, UPisCofins0_cl, DateUtils;

{$R *.dfm}

procedure TDmPisCofinsP.CDS100AfterInsert(DataSet: TDataSet);
begin
  with DmPisCofins0 do
  begin
    if Trim(CDS145COD_FILIAL.Text) <> '' then
      CDS100COD_FILIAL.Text :=
        CDS145COD_FILIAL.Text
    else
    begin
      MessageDlg('Nenhuma filial selecionada', mtError, [mbOk],0);
      DataSet.Cancel;
      Abort;
    end;

    CDS100DT_INI.Value := pDtIni;
    CDS100DT_FIN.Value := pDtFin;
  end;
end;

procedure TDmPisCofinsP.CDS100CalcFields(DataSet: TDataSet);
begin
  if CDS100VL_REC_ATIV_ESTAB.Value > 0 then
    CDS100vl_bc_cont.Value :=
    CDS100VL_REC_ATIV_ESTAB.Value;
  if (CDS100VL_BC_CONT.Value > 0) and
    (CDS100ALIQ_CONT.Value > 0) then
    CDS100vl_cont_apu.Value :=
      (CDS100ALIQ_CONT.Value * CDS100VL_BC_CONT.Value)/100
  else
    CDS100vl_cont_apu.Value := 0;
end;

end.
