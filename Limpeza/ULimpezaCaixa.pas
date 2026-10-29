unit ULimpezaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, variants, UFmHistorico, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFLimpezaCaixa = class(TFTCadSimples)
    Label21: TLabel;
    MeFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FmHistorico: TFmHistorico;
    procedure BtConsFilialClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaCaixa: TFLimpezaCaixa;

implementation

uses ULimpeza_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFLimpezaCaixa.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFLimpezaCaixa.MeFilialExit(Sender: TObject);
begin
  inherited;
 If Trim(MeFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MeFilial.Text))
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFLimpezaCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(MeDataI.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(MeDataF.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  With DMLimpeza do
  Begin
    QLimpeza_Caixa.Close;
    If Trim(MeFilial.Text) = '' Then
       QLimpeza_Caixa.SetVariable('Cod_Filial',Null)
    Else
       QLimpeza_Caixa.SetVariable('Cod_Filial',Trim(MeFilial.Text));
    If Trim(FmHistorico.MeHistorico.Text) = '' Then
       QLimpeza_Caixa.SetVariable('Cod_Historico',Null)
    Else
       QLimpeza_Caixa.SetVariable('Cod_Historico',Trim(FmHistorico.MeHistorico.Text));
    QLimpeza_Caixa.SetVariable('Dt_Movimento_Inic',Trim(MeDataI.Text));
    QLimpeza_Caixa.SetVariable('Dt_Movimento_Fim',Trim(MeDataf.Text));
    Try
      DMOracle.DBCemapa.StartTransaction;
      QLimpeza_Caixa.ExecSql;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;

  End;
end;

end.
