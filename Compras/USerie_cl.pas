unit USerie_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMSerie = class(TDataModule)
    DSSerie: TDataSource;
    DSSerieCons: TDataSource;
    QSerie: TOracleDataSet1;
    QSerieCons: TOracleDataSet1;
    QSerieConsCOD_SERIE: TStringField;
    QSerieConsNUM_SERIE: TIntegerField;
    QSerieConsCOD_FILIAL: TIntegerField;
    QSerieCOD_SERIE: TStringField;
    QSerieNUM_SERIE: TIntegerField;
    QSerieCOD_FILIAL: TIntegerField;
    QRSerie: TOracleDataSet1;
    QRSerieCOD_SERIE: TStringField;
    QRSerieNUM_SERIE: TIntegerField;
    QRSerieCOD_FILIAL: TIntegerField;
    QSerienome_filial: TStringField;
    QSerieNUM_SERIE_FISCAL: TIntegerField;
    QSerieConsNUM_SERIE_FISCAL: TIntegerField;
    QRSerieNUM_SERIE_FISCAL: TIntegerField;
    QSerieCOD_SERIE_MODELO: TStringField;
    QSerieModelo: TOracleDataSet1;
    DSSerieModelo: TDataSource;
    QSerieConsCOD_SERIE_MODELO: TStringField;
    QSerieModeloCOD_SERIE_MODELO: TStringField;
    QSerieModeloDESC_SERIE_MODELO: TStringField;
    QSerieModeloDESC_COMPLETA: TStringField;
    QSerieConsDESC_COMPLETA: TStringField;
    QRSerieDESC_COMPLETA: TStringField;
    QSerieCOD_USUARIO: TIntegerField;
    procedure QSerieCalcFields(DataSet: TDataSet);
    procedure QSerieAfterInsert(DataSet: TDataSet);
    procedure QSerieAfterOpen(DataSet: TDataSet);
    procedure QSerieBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Function NumeroSerie(wFilial:Real; wSerie, wSerieModelo: String; wCommit :Boolean = False):Integer;
  end;

var
  DMSerie: TDMSerie;

implementation

uses UOracle_cl, UParamSistema_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMSerie.QSerieCalcFields(DataSet: TDataSet);
begin
  QSerieNome_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ FloatToStr(QSerieCod_Filial.Value),True );
end;

Function TDMSerie.NumeroSerie(wFilial:Real; wSerie, wSerieModelo: String; wCommit :Boolean = False):Integer;
Var wRetorno : Integer;
    wTentativa : Integer;
Begin
  wRetorno := 0;
  wTentativa := 0;
//  QSerie.CommitOnPost := Not DMOracle.DBCemapa.InTransaction;
  While (wTentativa < 5) and (wRetorno = 0) do
  Begin
    Try
      QSerie.Close;
      QSerie.SetVariable('COD_FILIAL',wFilial);
      QSerie.SetVariable('COD_SERIE',wSerie);
      QSerie.SetVariable('COD_SERIE_MODELO', wSerieModelo);
      QSerie.Open;
      If QSerieCod_Serie.Value <> wSerie then
      Begin
        wTentativa := 6;
        MessageDlg('Série não cadastrada!', mtWarning, [mbOk], 0);
      End
      Else
      Begin
        QSerie.Edit;
        QSerieNum_Serie.Value := QSerieNum_Serie.Value + 1;
        QSerie.Post;
        if wCommit then
          DMOracle.DBCemapa.Commit;
        wRetorno := Round(QSerieNum_Serie.Value);
      End;
      QSerie.Close;
    Except
      wRetorno := 0;
      Inc(wTentativa);
      if wCommit then //Utilizado para não travar em fazer venda ao mesmo tempo com mesmo usuario/cliente/serie/modelo (Dona Benta/
        DMOracle.DBCemapa.Rollback;
      If QSerie.State in [dsEdit,dsInsert] then
        QSerie.Cancel;
    End;
  End;
  If wRetorno = 0 Then
    Raise Exception.Create('Não foi possível pegar próximo número da Série!');
  Result := wRetorno;
End;


procedure TDMSerie.QSerieAfterInsert(DataSet: TDataSet);
begin
  QSerieCod_Filial.Value := DMParamSistema.QParamSistemaCod_Filial.Value;
end;

procedure TDMSerie.QSerieAfterOpen(DataSet: TDataSet);
begin
  QSerieModelo.Open;
end;

procedure TDMSerie.QSerieBeforePost(DataSet: TDataSet);
begin
  if (QSerieCOD_FILIAL.Text <> '') then
    DMOracle.ValidaFilial(QSerieCOD_FILIAL.Text);
  QSerieCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
