unit UControleInterno_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMControleInterno = class(TDataModule)
    QControleInternoCad: TOracleDataSet1;
    QControleInternoCadCOD_CONTROLE: TIntegerField;
    QControleInternoCadCOD_FILIAL: TIntegerField;
    QControleInternoCadCOD_USUARIO: TIntegerField;
    QControleInternoCadDT_CONTROLE: TDateTimeField;
    QControleInternoCadIND_MODULO: TIntegerField;
    QControleInternoCadDESC_OPERACAO: TStringField;
    QRControleInterno: TOracleDataSet1;
    QControleInternoExcluir: TOracleDataSet1;
    QControleInternoExcluirCOD_CONTROLE: TIntegerField;
    QControleInternoExcluirCOD_FILIAL: TIntegerField;
    QControleInternoExcluirCOD_USUARIO: TIntegerField;
    QControleInternoExcluirDT_CONTROLE: TDateTimeField;
    QControleInternoExcluirIND_MODULO: TIntegerField;
    QControleInternoExcluirDESC_OPERACAO: TStringField;
    QRControleInternoNOME_MODULO: TStringField;
    QRControleInternoCOD_FILIAL: TIntegerField;
    QRControleInternoDESC_FILIAL: TStringField;
    QRControleInternoDT_CONTROLE: TDateTimeField;
    QRControleInternoCOD_USUARIO: TIntegerField;
    QRControleInternoNOME: TStringField;
    QRControleInternoDESC_OPERACAO: TStringField;
    procedure QControleInternoCadAfterInsert(DataSet: TDataSet);
    function Controle_Interno(mDESC_OPERACAO:String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMControleInterno: TDMControleInterno;

implementation

uses UOracle_cl, UTela_cl, UUsuario_cl;

{$R *.DFM}

function TDMControleInterno.Controle_Interno(
  mDESC_OPERACAO: String): String;
var mFechar : Boolean;
    mData   : TDateTime;
begin
  mFechar := False;  // Inicializa valor da variavel.
  mData   := Date;

  if DMUsuario.QUsuario.Active = false then
     DMUsuario.QUsuario.Active := True;

  if not DMOracle.DBCemapa.InTransaction then
  begin
    DMOracle.DBCemapa.StartTransaction;
    mFechar := True;
  end;

  with DMControleInterno do
  begin
    QControleInternoCad.Close;
    QControleInternoCad.Open;
    QControleInternoCad.Insert;
    QControleInternoCadCOD_FILIAL.Value    := DMUsuario.QUsuarioCOD_FILIAL.Value;
    QControleInternoCadCOD_USUARIO.Value   := DMUsuario.QUsuarioCOD_USUARIO.Value;
    QControleInternoCadIND_MODULO.Value    := DMTela.QVerificaTelaCOD_MODULO.Value;
    QControleInternoCadDT_CONTROLE.Value   := mData;
    QControleInternoCadDESC_OPERACAO.Value := mDESC_OPERACAO;
    QControleInternoCad.Post;
    if mFechar = True then
       DMOracle.DBCemapa.Commit;
  end;

end;

procedure TDMControleInterno.QControleInternoCadAfterInsert(
  DataSet: TDataSet);
begin
//  QControleInternoCadCOD_CONTROLE.Value := DMOracle.Sequencia('CONTROLE_INTERNO');
end;

end.
