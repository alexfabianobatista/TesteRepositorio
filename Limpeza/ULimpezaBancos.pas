unit ULimpezaBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, UFmContaCorrente, UFmHistorico, ActnList;

type
  TFLimpezaBancos = class(TFTCadSimples)
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FmHistorico: TFmHistorico;
    FmContaCorrente: TFmContaCorrente;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaBancos: TFLimpezaBancos;

implementation

uses ULimpeza_cl, UOracle_cl;

{$R *.DFM}

procedure TFLimpezaBancos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(MeDataI.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(MeDataF.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  With DMLimpeza do
  Begin
    QLimpeza_Bancos_Caixa.Close; //LIMPA TB_CAIXA_MOV
    QLimpeza_Bancos_Caixa.SetVariable('DT_MOVIMENTO_I',Trim(MeDataI.Text));
    QLimpeza_Bancos_Caixa.SetVariable('DT_MOVIMENTO_F',Trim(MeDataf.Text));
    Try
      DMOracle.DBCemapa.StartTransaction;
      QLimpeza_Bancos_Caixa.ExecSql;
      DMOracle.DBCemapa.Commit;
      //ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !');
    End; 

    QLimpeza_Bancos_Mov.Close; //LIMPA TB_BCO_MOVIMENTO_MOV
    QLimpeza_Bancos_Mov.SetVariable('DT_MOVIMENTO_I',Trim(MeDataI.Text));
    QLimpeza_Bancos_Mov.SetVariable('DT_MOVIMENTO_F',Trim(MeDataf.Text));
    Try
      DMOracle.DBCemapa.StartTransaction;
      QLimpeza_Bancos_Mov.ExecSql;
      DMOracle.DBCemapa.Commit;
      //ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !');
    End;

    QLimpeza_Bancos.Close; //LIMPA TB_BCO_MOVIMENTO
    QLimpeza_Bancos.SetVariable('Dt_Movimento_Inic',Trim(MeDataI.Text));
    QLimpeza_Bancos.SetVariable('Dt_Movimento_Fim',Trim(MeDataf.Text));
    Try
      DMOracle.DBCemapa.StartTransaction;
      QLimpeza_Bancos.ExecSql;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !');
    End;
  end; 
end;

end.
