unit UProprietario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMProprietario = class(TDataModule)
    QProprietarioCad: TOracleDataSet1;
    QProprietarioCadCOD_PROPRIETARIO: TIntegerField;
    QProprietarioCadNOME: TStringField;
    QProprietarioCadCOD_ESTADO: TStringField;
    QProprietarioCadDESC_ESTADO: TStringField;
    QProprietarioCons: TOracleDataSet1;
    QProprietarioConsCOD_PROPRIETARIO: TIntegerField;
    QProprietarioConsNOME: TStringField;
    QProprietarioConsDESC_ENDERECO: TStringField;
    QProprietarioConsDESC_TELEFONE: TStringField;
    QProprietarioConsCOD_ESTADO: TStringField;
    QRProprietario: TOracleDataSet1;
    QProprietarioCadNUM_CNPJ_CGC: TStringField;
    QProprietarioCadDESC_TELEFONE: TStringField;
    QProprietarioCadDESC_ENDERECO: TStringField;
    QProprietarioCadIND_FISICA_JURIDICA: TStringField;
    QProprietarioCadDESC_INSS: TStringField;
    QProprietarioCadCOD_USUARIO: TIntegerField;
    QProprietarioCadIND_SITUACAO: TStringField;
    QProprietarioCadDESC_OBSERVACAO: TStringField;
    QProprietarioCadDESC_INSCRICAO_IDENTIDADE: TStringField;
    QRProprietarioCOD_PROPRIETARIO: TIntegerField;
    QRProprietarioNOME: TStringField;
    QRProprietarioDESC_ENDERECO: TStringField;
    QRProprietarioDESC_CIDADE: TStringField;
    QRProprietarioDESC_TELEFONE: TStringField;
    QRProprietarioCOD_ESTADO: TStringField;
    QRProprietarioNUM_CNPJ_CGC: TStringField;
    QRProprietarioIND_FISICA_JURIDICA: TStringField;
    QRProprietarioDESC_INSS: TStringField;
    QRProprietarioCOD_USUARIO: TIntegerField;
    QRProprietarioIND_SITUACAO: TStringField;
    QRProprietarioDESC_OBSERVACAO: TStringField;
    QRProprietarioDESC_INSCRICAO_IDENTIDADE: TStringField;
    QProprietarioCadIND_TIPO_PROPRIETARIO: TIntegerField;
    QProprietarioCadCOD_CIDADE: TIntegerField;
    QProprietarioConsCOD_CIDADE: TIntegerField;
    QProprietarioConsdesc_cidade: TStringField;
    QProprietarioCadDESC_RNTRC: TStringField;
    QProprietarioCadCOD_TIPO_CADASTRO: TIntegerField;
    procedure QProprietarioCadAfterCancel(DataSet: TDataSet);
    procedure QProprietarioCadAfterPost(DataSet: TDataSet);
    procedure QProprietarioCadAfterOpen(DataSet: TDataSet);
    procedure QProprietarioCadAfterEdit(DataSet: TDataSet);
    procedure QProprietarioCadAfterInsert(DataSet: TDataSet);
    procedure QProprietarioCadBeforePost(DataSet: TDataSet);
    procedure QProprietarioCadIND_FISICA_JURIDICAChange(Sender: TField);
    procedure QProprietarioConsCalcFields(DataSet: TDataSet);
    procedure QProprietarioCadCOD_CIDADEChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProprietario: TDMProprietario;

implementation

uses UOracle_cl, UEstado_cl, UConhecimento_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TDMProprietario.QProprietarioCadAfterCancel(DataSet: TDataSet);
begin
//    FproprietarioCad.SBProprietario.enabled:=false;
end;

procedure TDMProprietario.QProprietarioCadAfterPost(DataSet: TDataSet);
begin
//    FproprietarioCad.SBProprietario.enabled:=false;
end;

procedure TDMProprietario.QProprietarioCadAfterOpen(DataSet: TDataSet);
begin
//    FproprietarioCad.SBProprietario.enabled:=true;
end;

procedure TDMProprietario.QProprietarioCadAfterEdit(DataSet: TDataSet);
begin
//    FproprietarioCad.SBProprietario.enabled:=true;
end;

procedure TDMProprietario.QProprietarioCadAfterInsert(DataSet: TDataSet);
begin
  QProprietarioCadIND_FISICA_JURIDICA.Value := 'F';
  QProprietarioCadIND_SITUACAO.Value := 'A';
  QProprietarioCadIND_TIPO_PROPRIETARIO.Value := 0;
  QProprietarioCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMProprietario.QProprietarioCadBeforePost(DataSet: TDataSet);
begin
  QProprietarioCadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMProprietario.QProprietarioCadIND_FISICA_JURIDICAChange(
  Sender: TField);
begin
  If QProprietarioCadIND_FISICA_JURIDICA.Value = 'F' Then
     QProprietarioCadNum_Cnpj_Cgc.EditMask := '###.###.###-##'
  Else
     QProprietarioCadNum_Cnpj_Cgc.EditMask := '##.###.###/####-##'
end;

procedure TDMProprietario.QProprietarioConsCalcFields(DataSet: TDataSet);
begin
  if QProprietarioConsCOD_CIDADE.Text <> '' then
    QProprietarioConsdesc_cidade.Value := DMOracle.FastSelect('DESC_CIDADE','TB_CIDADE','COD_CIDADE = '+QProprietarioConsCOD_CIDADE.Text);
end;

procedure TDMProprietario.QProprietarioCadCOD_CIDADEChange(Sender: TField);
begin
  if QProprietarioCadCOD_CIDADE.Text <> '' then
    QProprietarioCadCOD_ESTADO.Value := DMOracle.FastSelect('COD_ESTADO','TB_CIDADE','COD_CIDADE = '+QProprietarioCadCOD_CIDADE.Text);
end;

end.
