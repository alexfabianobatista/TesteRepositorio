unit USuporte_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMSuporte = class(TDataModule)
    QSuporte: TOracleDataSet1;
    QSuporteCOD_SUPORTE: TIntegerField;
    QSuporteCOD_CADASTRO: TIntegerField;
    QSuporteNOME_TELA: TStringField;
    QSuporteCOD_FUNCAO: TIntegerField;
    QSuporteCOD_ANALISTA_SUPORTE: TIntegerField;
    QSuporteNOME_MODULO: TStringField;
    QSuporteDT_ABERTURA: TDateTimeField;
    QSuporteNOME_CONTATO: TStringField;
    QSuporteDESC_PROBLEMA: TMemoField;
    QSuporteDESC_TIPO_SUPORTE: TStringField;
    QSuporteDESC_SOLUCAO: TMemoField;
    QSuporteDT_FECHAMENTO: TDateTimeField;
    QSuporteDESC_OBSERVACAO: TMemoField;
    QSuporteCons: TOracleDataSet1;
    QSuporteConsNOME_CLIENTE: TStringField;
    QSuporteConsNOME_USUARIO: TStringField;
    QSuporteConsNOME_TELA: TStringField;
    QSuporteConsNOME_MODULO: TStringField;
    QSuporteIND_PRIORIDADE: TIntegerField;
    QSuporteConsCOD_SUPORTE: TIntegerField;
    QSuporteConsDESC_PROBLEMA: TStringField;
    QSuporteConsDT_ABERTURA: TDateTimeField;
    QSuporteConsDT_FECHAMENTO: TDateTimeField;
    QSuporteIND_SITUACAO: TStringField;
    QSuporteConsIND_SITUACAO: TStringField;
    QSuporteConsDESC_TIPO_SUPORTE: TStringField;
    QSuporteIND_ATUALI_ENVIADA: TStringField;
    QSuporteDT_HR_ENVIO: TDateTimeField;
    QSuporteCOD_COMMIT_SVN: TIntegerField;
    QSuporteCOD_USUARIO: TIntegerField;
    procedure QSuporteAfterInsert(DataSet: TDataSet);
    procedure QSuporteBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSuporte: TDMSuporte;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMSuporte.QSuporteAfterInsert(DataSet: TDataSet);
begin
  QSuporteDT_ABERTURA.Value := Date;
  QSuporteIND_PRIORIDADE.Value := 2;
  QSuporteIND_SITUACAO.Value := 'ABERTO';
  QSuporteCOD_ANALISTA_SUPORTE.Value := DMUsuario.CodUsuarioCorrente;
  QSuporteCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMSuporte.QSuporteBeforePost(DataSet: TDataSet);
begin
  QSuporteNOME_CONTATO.Text := UpperCase(QSuporteNOME_CONTATO.Text);
end;

end.                 
