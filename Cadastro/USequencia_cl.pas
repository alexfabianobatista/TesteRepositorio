unit USequencia_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, variants;

type
  TDMSequencia = class(TDataModule)
    DSSequencia: TDataSource;
    QSequencia: TOracleDataSet1;
    QSequenciaNOME_SEQUENCIA: TStringField;
    QSequenciaCOD_FILIAL: TIntegerField;
    QSequenciaVAL_SEQUENCIA: TIntegerField;
    procedure QSequenciaAfterPost(DataSet: TDataSet);
    procedure QSequenciaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SetaFilial(wFilial:Integer;wSequencia:String);
    Function Sequencia(wFilial:Integer;wSequencia:String):Integer;
  end;

var
  DMSequencia: TDMSequencia;

implementation

uses UOracle_cl;

{$R *.DFM}

{ TDMSequencia }

procedure TDMSequencia.SetaFilial(wFilial:Integer;wSequencia:String);
begin
  QSequencia.Close;
  If wFilial > 0 Then
    QSequencia.SetVariable('PK',wFilial)
  Else
    QSequencia.SetVariable('PK',Null);
  If wSequencia <> '' Then
    QSequencia.SetVariable('SEQUENCIA',wSequencia)
  Else
    QSequencia.SetVariable('SEQUENCIA',Null);
  QSequencia.Open;
end;

procedure TDMSequencia.QSequenciaAfterPost(DataSet: TDataSet);
begin
  QSequencia.Close;
  QSequencia.Open;
end;

Function TDMSequencia.Sequencia(wFilial: Integer;
  wSequencia: String): Integer;
begin
  Try
    Result := 0;
    QSequencia.CommitOnPost := Not DMOracle.DBCemapa.InTransaction;
    QSequencia.Close;
    QSequencia.SetVariable('PK',wFilial);
    QSequencia.SetVariable('SEQUENCIA',wSequencia);
    QSequencia.Open;
    If QSequenciaNome_Sequencia.Value = wSequencia Then
    Begin
      QSequencia.Edit;
      QSequenciaVal_Sequencia.Value := QSequenciaVal_Sequencia.Value + 1;
      try
        QSequencia.Post;
      except
        QSequencia.Cancel;
        Raise;
      end;
      Result := Trunc(QSequenciaVal_Sequencia.Value);
    End
    Else
//      If MessageDlg('Sequencia '+wSequencia+' não cadastrada!'
//                   +Chr(13)+'Cadastrar agora?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
      Begin
        QSequencia.Insert;
        QSequenciaCod_Filial.Value := wFilial;
        QSequenciaVal_Sequencia.Value := 1;
        QSequenciaNome_sequencia.Value := wSequencia;
        QSequencia.Post;
        Result := 1;
      End;
//      Else
//        Abort;
    QSequencia.Close;
  Except
    Raise;
  End;
end;

procedure TDMSequencia.QSequenciaBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QSequenciaCOD_FILIAL.Text);
end;

end.
