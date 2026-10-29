unit ULimpezaRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmDatas, UFmFilial;

type
  TFLimpezaRomaneio = class(TFTCadSimples)
    FmFilial1: TFmFilial;
    FmDatas1: TFmDatas;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RgTipoRomaneio: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaRomaneio: TFLimpezaRomaneio;

implementation

uses ULimpeza_cl, UOracle_cl;

{$R *.dfm}

procedure TFLimpezaRomaneio.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(FmDatas1.MeDtInicial.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(FmDatas1.MeDtFinal.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');

  With DMLimpeza do
  Begin
    QLimpezaRomaneio.Close;
    QLimpeza_Rateio_Romaneio.Close;
    QLimpezaBalanca.Close;
    If Trim(FmFilial1.MeFilial.Text) = '' Then
       QLimpezaRomaneio.SetVariable('Cod_Filial',Null)
    Else
       QLimpezaRomaneio.SetVariable('Cod_Filial',StrToInt(Trim(FmFilial1.MeFilial.Text)));
    QLimpezaRomaneio.SetVariable('Dt_Inicio',Trim(FmDatas1.MeDtInicial.Text));
    QLimpezaRomaneio.SetVariable('Dt_Fim',Trim(FmDatas1.MeDtFinal.Text));
    Case RgTipoRomaneio.Itemindex of
      0 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', Null);
      1 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'ROMANEIO');
      2 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'PESAGEM EN');
      3 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'PESAGEM SA');
      4 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'PESAGEM PA');
      5 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'TRANSF ENT');
      6 : QLimpezaRomaneio.SetVariable('Ind_Tipo_Romaneio', 'TRANSF SAI');
    End;
    QLimpezaRomaneio.Open;
    QLimpeza_Rateio_Romaneio.Open;
    QLimpezaBalanca.Open;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not(QLimpezaRomaneio.Eof) Do
       Begin
         While not(QLimpeza_Rateio_Romaneio.Eof) Do
           QLimpeza_Rateio_Romaneio.Delete; //limpeza do rateio dos romaneios
         While not(QLimpezaBalanca.Eof) Do
           QLimpezaBalanca.Delete; //limpeza das pesagens balança


         QLimpezaRomaneio.Delete; // exclui a Romaneio
       End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;
    QLimpezaRomaneio.Close;
    QLimpeza_Rateio_Romaneio.Close;
    QLimpezaBalanca.Close;
  End;
end;

end.
