unit UCaixa_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMCaixa = class(TDataModule)
    DSCaixa_Mov: TDataSource;
    QCaixaDet_Cons: TOracleDataSet1;
    QCaixaDet_ConsCOD_CAIXA_DET: TIntegerField;
    QCaixaDet_ConsCOD_FILIAL: TIntegerField;
    QCaixaDet_ConsCOD_DEPARTAMENTO: TIntegerField;
    QCaixaDet_ConsDT_MOVIMENTO: TDateTimeField;
    QCaixaDet_ConsVAL_DINHEIRO: TFloatField;
    QCaixaDet_ConsVAL_VALES: TFloatField;
    QCaixaDet_ConsVAL_CHEQUES: TFloatField;
    QCaixaDet_ConsVAL_OUTROS: TFloatField;
    QCaixaDet_Consdesc_filial: TStringField;
    QCaixaDet_Consdesc_departamento: TStringField;
    QCaixaDet_Cad: TOracleDataSet1;
    QCaixaDet_CadCOD_CAIXA_DET: TIntegerField;
    QCaixaDet_CadCOD_FILIAL: TIntegerField;
    QCaixaDet_CadCOD_DEPARTAMENTO: TIntegerField;
    QCaixaDet_CadDT_MOVIMENTO: TDateTimeField;
    QCaixaDet_CadVAL_DINHEIRO: TFloatField;
    QCaixaDet_CadVAL_VALES: TFloatField;
    QCaixaDet_CadVAL_CHEQUES: TFloatField;
    QCaixaDet_CadVAL_OUTROS: TFloatField;
    QCaixaDet_Caddesc_filial: TStringField;
    QCaixaDet_Caddesc_departamento: TStringField;
    QSaldo: TOracleDataSet1;
    QSaldoCREDITO: TFloatField;
    QCaixa_Mov_Cons: TOracleDataSet1;
    QCaixa_Mov: TOracleDataSet1;
    QCaixa_MovCOD_CAIXA_MOV: TIntegerField;
    QCaixa_MovCOD_USUARIO: TIntegerField;
    QCaixa_MovCOD_FILIAL: TIntegerField;
    QCaixa_MovCOD_DEPARTAMENTO: TIntegerField;
    QCaixa_MovCOD_HISTORICO: TIntegerField;
    QCaixa_MovDT_MOVIMENTO: TDateTimeField;
    QCaixa_MovVAL_MOVIMENTO: TFloatField;
    QCaixa_MovDESC_HORARIO: TStringField;
    QCaixa_MovCOD_CADASTRO: TIntegerField;
    QCaixa_MovCOD_NOTA_CAB: TIntegerField;
    QCaixa_MovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixa_MovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixa_MovDT_USUARIO: TDateTimeField;
    QCaixa_MovDESC_COMPLEMENTO: TStringField;
    QCaixa_MovDESC_COMPLEMENTO1: TStringField;
    QCaixa_MovCOD_CONTRATO_MOV: TIntegerField;
    QCaixa_MovCOD_BCO_MOVIMENTO: TIntegerField;
    QCaixa_Movnome_filial: TStringField;
    QCaixa_Movnome_departamento: TStringField;
    QCaixa_Movnome_cadastro: TStringField;
    QCaixa_Movnome_historico: TStringField;
    QCaixa_Movcod_historico_contabil: TIntegerField;
    QCaixa_Movcod_contabil_cred: TStringField;
    QCaixa_Movcod_contabil_deb: TStringField;
    QSaldoDEBITO: TFloatField;
    QCaixa_Mov_ConsCOD_CAIXA_MOV: TIntegerField;
    QCaixa_Mov_ConsCOD_USUARIO: TIntegerField;
    QCaixa_Mov_ConsCOD_FILIAL: TIntegerField;
    QCaixa_Mov_ConsCOD_DEPARTAMENTO: TIntegerField;
    QCaixa_Mov_ConsCOD_HISTORICO: TIntegerField;
    QCaixa_Mov_ConsDT_MOVIMENTO: TDateTimeField;
    QCaixa_Mov_ConsVAL_MOVIMENTO: TFloatField;
    QCaixa_Mov_ConsDESC_HORARIO: TStringField;
    QCaixa_Mov_ConsCOD_CADASTRO: TIntegerField;
    QCaixa_Mov_ConsCOD_NOTA_CAB: TIntegerField;
    QCaixa_Mov_ConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixa_Mov_ConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixa_Mov_ConsDT_USUARIO: TDateTimeField;
    QCaixa_Mov_ConsDESC_COMPLEMENTO: TStringField;
    QCaixa_Mov_ConsNOME: TStringField;
    QCaixa_MovNUM_OS: TIntegerField;
    QCaixa_Mov_ConsVAL_VARIACAO: TFloatField;
    QCaixa_MovNUM_DOCUMENTO: TFloatField;
    QCaixa_MovCOD_CONHECIMENTO: TIntegerField;
    QCaixa_MovCOD_IMOVEL: TIntegerField;
    QCaixa_MovIND_DESCONTA_LOCATARIO: TStringField;
    QCaixa_Mov_ConsNUM_DOCUMENTO: TFloatField;
    QCaixa_MovCOD_ADIANTAMENTO: TIntegerField;
    QCaixa_Documento: TOracleDataSet;
    QCaixa_DocumentoCOD_CAIXA_DOCUMENTO: TIntegerField;
    QCaixa_DocumentoNOME_ARQUIVO: TStringField;
    QCaixa_DocumentoDT_INCLUSAO: TDateTimeField;
    QCaixa_DocumentoDESCRICAO: TStringField;
    QCaixa_DocumentoCOD_CAIXA_MOV: TIntegerField;
    QCaixa_DocumentoARQUIVO: TBlobField;
    QCaixa_MovCOD_EMBARQUE: TIntegerField;
    QCaixa_MovCOD_ORDEM_SERVICO_CAB: TIntegerField;
    procedure QCaixa_MovAfterInsert(DataSet: TDataSet);
    procedure QCaixa_MovBeforePost(DataSet: TDataSet);
    procedure QCaixa_MovCalcFields(DataSet: TDataSet);
    procedure QCaixaDet_CadCalcFields(DataSet: TDataSet);
    procedure QCaixaDet_CadAfterInsert(DataSet: TDataSet);
    procedure QCaixaDet_ConsCalcFields(DataSet: TDataSet);
    procedure QCaixa_MovBeforeEdit(DataSet: TDataSet);
    procedure QCaixa_MovBeforeInsert(DataSet: TDataSet);
    procedure QCaixa_MovCOD_HISTORICOChange(Sender: TField);
    procedure QCaixa_MovAfterPost(DataSet: TDataSet);
    procedure QCaixaDet_CadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fCalcFields_Caixa : Boolean;
  public
    { Public declarations }
    Property pCalcFields_Caixa : Boolean Read fCalcFields_Caixa Write fCalcFields_Caixa Default True;
    procedure IncluiCaixa(wFilial,wDepartamento,wHistorico,
                          wValorMov,wNumDoc,wCadastro:Real;
                          wComplemento : String;
                          wDtMovimento : tDateTime;
                          wCod_Conta_Pagar_Cab,wCod_Conta_Receber_Cab,wContrato_Mov,wConhecimento : String;
                          wNumOS: Integer = 0;
                          wCod_Embarque: Integer = 0);
  end;

var
  DMCaixa: TDMCaixa;
  wComplemento,wComplemento1 : String;
implementation

uses UOracle_cl, UUsuario_cl, UParamSistema_cl, UContasReceber_cl;

{$R *.DFM}

procedure TDMCaixa.QCaixa_MovAfterInsert(DataSet: TDataSet);
begin
  If Trim(QCaixa_MovDt_Movimento.Text) = '' Then
     QCaixa_MovDt_Movimento.Value:=DMOracle.DataServ;
  QCaixa_MovCod_Filial.Value:=DMUsuario.CodFilialUsuario;
  QCaixa_MovCod_Departamento.Value:=StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMUsuario.CodUsuarioCorrente)));
//  QCaixa_MovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
//  QCaixa_MovDt_Usuario.Value:=DMOracle.DataHoraServ;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
   Begin
     QCaixa_MovDESC_COMPLEMENTO.Value := wComplemento;
     QCaixa_MovDESC_COMPLEMENTO1.Value := wComplemento1;
   End;
end;

procedure TDMCaixa.QCaixa_MovBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QCaixa_MovCOD_FILIAL.Text);
  QCaixa_MovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QCaixa_MovDt_Usuario.Value:=DMOracle.DataHoraServ;
end;

procedure TDMCaixa.QCaixa_MovCalcFields(DataSet: TDataSet);
var wtestaNulo:String;
 x, y: array of string;
begin
  setLength(x, 7); //5 sql diferentes
  setLength(y, 7);
  If pCalcFields_Caixa Then  // campo usado para nao calcular os campos quando inclui um lancamento pela baixa de titulos
  Begin                      // do contas a pagar e contas a receber
    x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = '+FloatToStr(QCaixa_MovCod_Filial.Value);
    x[1] := 'SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO WHERE COD_DEPARTAMENTO = '+FloatToStr(QCaixa_MovCod_Departamento.Value);
    if QCaixa_MovCod_Cadastro.Value <> 0 then
      x[2] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+FloatToStr(QCaixa_MovCod_Cadastro.Value)
    else
      x[2] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = null ';
    x[3] := 'SELECT DESC_HISTORICO FROM TB_HISTORICO WHERE COD_HISTORICO = '+FloatToStr(QCaixa_MovCod_Historico.Value);
    x[4] := 'SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO WHERE COD_HISTORICO = '+FloatToStr(QCaixa_MovCod_Historico.Value);
    x[5] := 'SELECT COD_CONTABIL_CRED FROM TB_HISTORICO WHERE COD_HISTORICO = '+FloatToStr(QCaixa_MovCod_Historico.Value);
    x[6] := 'SELECT COD_CONTABIL_DEB FROM TB_HISTORICO WHERE COD_HISTORICO = '+FloatToStr(QCaixa_MovCod_Historico.Value);
    DMOracle.BuscaNomes(x, y);
    QCaixa_MovNome_Filial.Value:=Y[0];
    QCaixa_MovNome_Departamento.Value:=Y[1];
    QCaixa_MovNome_Cadastro.Value:=Y[2];
    QCaixa_MovNome_Historico.Value:=Y[3];
    wTestaNulo:=Y[4];
    if Trim(wTestaNulo) <> '' then
      QCaixa_MovCod_Historico_Contabil.Value:=StrToInt(wTestaNulo);
    QCaixa_MovCod_Contabil_Cred.Value:=Y[5];
    QCaixa_MovCod_Contabil_Deb.Value:=Y[6];
  End;
end;

procedure TDMCaixa.QCaixaDet_CadCalcFields(DataSet: TDataSet);
begin
  QCaixaDet_CadDesc_Filial.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QCaixaDet_CadCod_Filial.Value));
  QCaixaDet_CadDesc_Departamento.Value:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+FloatToStr(QCaixaDet_CadCod_Departamento.Value));
end;

procedure TDMCaixa.QCaixaDet_CadAfterInsert(DataSet: TDataSet);
begin
  QCaixaDet_CadDt_Movimento.Value:=DMOracle.DataServ;
  QCaixaDet_CadCod_Filial.Value:=DMUsuario.CodFilialUsuario;
  QCaixaDet_CadCod_Departamento.Value:=StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMUsuario.CodUsuarioCorrente)));
end;

procedure TDMCaixa.QCaixaDet_ConsCalcFields(DataSet: TDataSet);
begin
  QCaixaDet_ConsDesc_Filial.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QCaixaDet_ConsCod_Filial.Value));
  QCaixaDet_ConsDesc_Departamento.Value:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+FloatToStr(QCaixaDet_ConsCod_Departamento.Value));
end;

procedure TDMCaixa.IncluiCaixa(wFilial,wDepartamento,wHistorico,
                               wValorMov,wNumDoc,wCadastro : Real;
                               wComplemento : String;
                               wDtMovimento : tDateTime;
                               wCod_Conta_Pagar_Cab,wCod_Conta_Receber_Cab,wContrato_Mov, wConhecimento : String;
                               wNumOS: Integer = 0;
                               wCod_Embarque: Integer = 0);
begin
  // Inclui Lancamento no Caixa //
  QCaixa_mov.Open;
  QCaixa_mov.Insert;
  QCaixa_movCOD_FILIAL.Value := Trunc(wFilial);
  If wDepartamento <> 0 Then  // se estiver com zeros pega o departamento do after insert
    If ((DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL') Or
        (DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'paper')   Or
        (DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'BRASIL')) Then
       QCaixa_movCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario
    Else
       QCaixa_movCOD_DEPARTAMENTO.Value := Trunc(wDepartamento);
  QCaixa_movCOD_HISTORICO.Value := Trunc(wHistorico);
  QCaixa_movVAL_MOVIMENTO.Value := wValorMov;
  QCaixa_movNUM_DOCUMENTO.Value := Trunc(wNumDoc);
  if DMParamSistema.CodEmpresa <> 'HOSPITAL' then //Solicitado por Diego. Junior 08/02/2019
    QCaixa_movDESC_COMPLEMENTO.Value := wComplemento;
  If wCadastro <> 0 Then
     QCaixa_movCOD_CADASTRO.Value := Trunc(wCadastro);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
    QCaixa_movDT_MOVIMENTO.Value := DMOracle.DataServ
  Else    
    QCaixa_movDT_MOVIMENTO.Value := wDtMovimento;
  If wCod_Conta_Pagar_Cab <> '' Then
     QCaixa_movCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCod_Conta_Pagar_Cab);
  If wCod_Conta_Receber_Cab <> '' Then
     QCaixa_movCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCod_Conta_Receber_Cab);
  If wContrato_Mov <> '' Then
     QCaixa_movCOD_CONTRATO_MOV.Value := StrToInt(wContrato_Mov);
  If wConhecimento <> '' Then
     QCaixa_movCOD_CONHECIMENTO.Value := StrToInt(wConhecimento);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' Then
    QCaixa_MovDESC_COMPLEMENTO1.Value := DMContasReceber.QContasReceberBaixaDESC_OBSERVACAO.Text;
{  if wNumOS > 0 then
    QCaixa_MovNUM_OS.Value := wNumOS;}
  if wNumOS > 0 then
    QCaixa_MovCOD_ORDEM_SERVICO_CAB.Value := wNumOS;
  if wCod_Embarque > 0 then
    QCaixa_MovCOD_EMBARQUE.Value := wCod_Embarque;
  QCaixa_mov.Post;
end;

procedure TDMCaixa.QCaixa_MovBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCaixa.QCaixa_MovBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCaixa.QCaixa_MovCOD_HISTORICOChange(Sender: TField);
//Var wHistorico_Contabil, wDesc : String;
begin
{  If QCaixa_MovCod_Historico.Text <> '' Then
  Begin
     wHistorico_Contabil := (DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QCaixa_MovCod_Historico.Value)));
     If wHistorico_Contabil <> '' then
      Begin
        wDesc := (DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+ wHistorico_Contabil));
        If wDesc <> '' Then
           QCaixa_MovDesc_Complemento.Value := wDesc;
      End;
  End;
}  
end;

procedure TDMCaixa.QCaixa_MovAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QCaixa_MovCod_Caixa_Mov.Value;
  QCaixa_mov.Close;
  QCaixa_mov.SetVariable('PK',wCodigo);
  QCaixa_mov.Open;
  wComplemento := QCaixa_MovDESC_COMPLEMENTO.Value;
  wComplemento1 := QCaixa_MovDESC_COMPLEMENTO1.Value;

end;

procedure TDMCaixa.QCaixaDet_CadBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QCaixaDet_CadCOD_FILIAL.Text);
end;

end.
