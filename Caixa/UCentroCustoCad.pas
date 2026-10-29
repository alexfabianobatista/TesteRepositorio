unit UCentroCustoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFCentroCustoCad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    CentrodeCustoHistrico1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure CentrodeCustoHistrico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCentroCustoCad: TFCentroCustoCad;

implementation

uses UCentroCusto_cl, UCentroCustoCons, UHistoricoParam,
  URCentroCustoHistorico;

{$R *.DFM}

procedure TFCentroCustoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCentroCusto.QCentroCusto.Open;
end;

procedure TFCentroCustoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCentroCusto.QCentroCusto.Close;
  Action:= CaFree;
  FCentroCustoCad:= Nil;

end;

procedure TFCentroCustoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCentroCustoCons = Nil then
    FCentroCustoCons:= TFCentroCustoCons.Create(Application);
  If FCentroCustoCons.Showmodal = MrOk then
  Begin
    DMCentroCusto.QCentroCusto.Close;
    DMCentroCusto.QCentroCusto.SetVariable('PK',DMCentroCusto.QCentroCustoConsCOD_CENTRO_CUSTO.Value);
    DMCentroCusto.QCentroCusto.Open;
  End;
end;

procedure TFCentroCustoCad.CentrodeCustoHistrico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoParam=Nil then
     FHistoricoParam:=TFHistoricoParam.Create(Application);
  FHistoricoParam.PGRelatorio.Pages[1].TabVisible:=True;
  If FHistoricoParam.ShowModal=MrOk then
    begin
      //DmUsuario.Checar_Filial_Usuario(Trim(FCaixaParam.ME8Filial.Text),'CAIXA'); //Segurança de Filial
      with DMCentroCusto do
        begin
          QRCentroCustoHistorico.Close;
          if Trim(FHistoricoParam.Me1DtInicial.text) = '' then
          raise exception.create ('É necessário informar a data inicial');
          if Trim(FHistoricoParam.Me1DtFinal.text) = '' then
          raise exception.create ('É necessário informar a data final');
          if Trim(FHistoricoParam.ME1Filial.Text)<>'' then
            QRCentroCustoHistorico.SetVariable('COD_FILIAL',StrToInt(Trim(FHistoricoParam.ME1Filial.Text)))
          else
            QRCentroCustoHistorico.SetVariable('COD_FILIAL',Null);

          if Trim(FHistoricoParam.ME1Departamento.Text)<>'' then
            QRCentroCustoHistorico.SetVariable('DEPARTAMENTO',StrToInt(Trim(FHistoricoParam.ME1Departamento.Text)))
          else
            QRCentroCustoHistorico.SetVariable('DEPARTAMENTO',Null);

          QRCentroCustoHistorico.SetVariable('DT_INICIAL',StrToDate(FHistoricoParam.ME1DtInicial.Text));
          QRCentroCustoHistorico.SetVariable('DT_FINAL',StrToDate(FHistoricoParam.ME1DtFinal.Text));
          If FHistoricoParam.Rg1ContasPagar.ItemIndex = 0 Then
             QRCentroCustoHistorico.SetVariable('IND_CONTAS_PAGAR','1 = 1')  // considera movtos de contas a pagar na sql
          Else
             QRCentroCustoHistorico.SetVariable('IND_CONTAS_PAGAR','1 = 2');  // não considera movtos de contas a pagar na sql
          QRCentroCustoHistorico.Open;
          if FRCentroCustoHistorico = Nil then
            FRCentroCustoHistorico:=TFRCentroCustoHistorico.Create(Application);
            FRCentroCustoHistorico.QRLEmpresa.Caption:='FILIAL:'+ FHistoricoParam.Ed1Filial.Text;

          if (FHistoricoParam.ME1DtInicial.Text <> '') or
             (FHistoricoParam.ME1DtFinal.Text <> '') then
             FRCentroCustoHistorico.QRLTitulo.Caption:='Mov. de Caixa por Histórico e Centro de Custo '+ FHistoricoParam.ME1DtInicial.Text
             + ' até '+FHistoricoParam.ME1DtFinal.Text
          else
             FRCentroCustoHistorico.QRLTitulo.Caption:='Mov. de Caixa por Histórico e Centro de Custo';

          If FHistoricoParam.RGPreview.ItemIndex=0 then
            FRCentroCustoHistorico.QRPrimario.Preview
          else
            FRCentroCustoHistorico.QRPrimario.Print;
          QRCentroCustoHistorico.Close;
        end;
    end;

end;

end.
