unit UMensagemUsuario_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UUsuario_cl;

type
  TDmMensagemUsuario = class(TDataModule, IMensagemUsuario)
    QMensagemUsuario: TOracleDataSet1;
    QMensagemUsuarioCOD_MENSAGEM_USUARIO: TIntegerField;
    QMensagemUsuarioCOD_USUARIO_ORIGEM: TIntegerField;
    QMensagemUsuarioCOD_USUARIO_DESTINO: TIntegerField;
    QMensagemUsuarioDESC_TIPO_FUNCIONARIO: TStringField;
    QMensagemUsuarioDT_VIGENCIA_INI: TDateTimeField;
    QMensagemUsuarioDT_VIGENCIA_FIN: TDateTimeField;
    QMensagemUsuarioDESC_MENSAGEM: TStringField;
    QMensagemUsuarioCons: TOracleDataSet1;
    QMensagemUsuarioConsCOD_MENSAGEM_USUARIO: TIntegerField;
    QMensagemUsuarioConsCOD_USUARIO_ORIGEM: TIntegerField;
    QMensagemUsuarioConsCOD_USUARIO_DESTINO: TIntegerField;
    QMensagemUsuarioConsDESC_TIPO_FUNCIONARIO: TStringField;
    QMensagemUsuarioConsDT_VIGENCIA_INI: TDateTimeField;
    QMensagemUsuarioConsDT_VIGENCIA_FIN: TDateTimeField;
    QMensagemUsuarioConsDESC_MENSAGEM: TStringField;
    QMensagemUsuarioConsNOME_USUARIO_ORIGEM: TStringField;
    QMensagemUsuarioConsNOME_USUARIO_DESTINO: TStringField;
    QMostraMensagem: TOracleDataSet1;
    QMostraMensagemCOD_MENSAGEM_USUARIO: TIntegerField;
    QMostraMensagemCOD_USUARIO_ORIGEM: TIntegerField;
    QMostraMensagemCOD_USUARIO_DESTINO: TIntegerField;
    QMostraMensagemDESC_TIPO_FUNCIONARIO: TStringField;
    QMostraMensagemDT_VIGENCIA_INI: TDateTimeField;
    QMostraMensagemDT_VIGENCIA_FIN: TDateTimeField;
    QMostraMensagemDESC_MENSAGEM: TStringField;
    QMostraMensagemNOME_USUARIO_ORIGEM: TStringField;
    procedure QMensagemUsuarioAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function Query: TOracleDataset1;
  end;

var
  DmMensagemUsuario: TDmMensagemUsuario;

implementation

{$R *.dfm}

procedure TDmMensagemUsuario.QMensagemUsuarioAfterInsert(
  DataSet: TDataSet);
begin
  QMensagemUsuarioDESC_TIPO_FUNCIONARIO.Value := 'TODOS';
  QMensagemUsuarioCOD_USUARIO_ORIGEM.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDmMensagemUsuario.DataModuleCreate(Sender: TObject);
begin
  DMUsuario.MensagemUsuario := Self;
end;

function TDmMensagemUsuario.Query: TOracleDataset1;
begin
  Result := QMostraMensagem;
end;

procedure TDmMensagemUsuario.DataModuleDestroy(Sender: TObject);
begin
  DMUsuario.MensagemUsuario := nil;
end;

end.
