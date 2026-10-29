unit UTela_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTela = class(TDataModule)
    DSTela: TDataSource;
    DSTelaCons: TDataSource;
    QTela: TOracleDataSet1;
    QTelaCons: TOracleDataSet1;
    QVerificaTela: TOracleDataSet1;
    QModulo: TOracleDataSet1;
    QDireitoUsuMenu: TOracleDataSet1;
    QDireitoUsuBotao: TOracleDataSet1;
    QTelaDESC_TELA: TStringField;
    QTelaDT_CADASTRO: TDateTimeField;
    QTelaIND_SITUACAO: TStringField;
    QTelaCOD_MODULO: TIntegerField;
    QTelaConsDESC_TELA: TStringField;
    QVerificaTelaDESC_TELA: TStringField;
    QVerificaTelaDT_CADASTRO: TDateTimeField;
    QVerificaTelaIND_SITUACAO: TStringField;
    QVerificaTelaCOD_MODULO: TIntegerField;
    QModuloCOD_MODULO: TIntegerField;
    QModuloNOME_MODULO: TStringField;
    QDireitoUsuMenuCOD_USUARIO: TIntegerField;
    QDireitoUsuMenuCOD_FUNCAO: TIntegerField;
    QDireitoUsuMenuNUM_ITEM_MENU1: TIntegerField;
    QDireitoUsuMenuNUM_ITEM_MENU2: TIntegerField;
    QDireitoUsuMenuNOME_BOTAO: TStringField;
    QDireitoUsuBotaoCOD_USUARIO: TIntegerField;
    QDireitoUsuBotaoNOME_BOTAO: TStringField;
    QVerificaTelaNOME_TELA: TStringField;
    QDireitoUsuMenuNOME_TELA: TStringField;
    QDireitoUsuBotaoNOME_TELA: TStringField;
    QTelaConsNOME_TELA: TStringField;
    QTelaNOME_TELA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure VerificaTela(pModulo, pDescTela, pNomeTela : String);
  end;

var
  DMTela: TDMTela;

implementation

uses UOracle_cl, UFuncao_cl;

{$R *.DFM}

Procedure TDMTela.VerificaTela(pModulo, pDescTela, pNomeTela : String);
Begin
  QVerificaTela.Close;
  QVerificaTela.SetVariable('NOME_TELA',Trim(pNomeTela));
  QVerificaTela.Open;
  If QVerificaTela.RecordCount = 0 then
  Begin
//    If MessageDlg('ATENÇÃO: Esta tela ainda não foi cadastrada no Controle de Acesso!'
//                  +Chr(10)+'Cadadastrar automaticamente?',
//                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//    Begin // Cadastrar Tela
    QModulo.Close;
    QModulo.SetVariable('NOME_MODULO',UpperCase(pModulo));
    QModulo.Open;
    QVerificaTela.Insert;
    QVerificaTelaCOD_MODULO.Value := QModuloCOD_MODULO.Value;
    QVerificaTelaDESC_TELA.Value := pDescTela;
    QVerificaTelaNOME_TELA.Value := Trim(pNomeTela);
    QVerificaTelaDT_CADASTRO.Value := DMOracle.DataServ;
    QVerificaTelaIND_SITUACAO.Value := 'A';
    try
      QVerificaTela.Post;
    except
      QVerificaTela.Cancel;
      DMOracle.DBCemapa.Rollback;
      //MessageDlg('Não foi possível cadastrar esta tela no controle de acesso.', mtError, [mbOK], 0);
    end;
//    End;
  End
  Else
    If QVerificaTelaIND_SITUACAO.Value = 'I' then
      Raise Exception.Create('Esta Tela está Inativa!');
End;

end.
