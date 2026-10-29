unit URecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRecebimento = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBPCadastro: TDBPanel;
    DBGrid1: TDBGrid;
    BTPagar: TBitBtn;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    Label2: TLabel;
    DBPanel4: TDBPanel;
    RecebimentodeAssinantes1: TMenuItem;
    btExcluir: TBitBtn;
    DBPanel5: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure DBPCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTPagarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RecebimentodeAssinantes1Click(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
    procedure Pagar(pValor: Double);
    procedure VoltaPagamento;
  public
    { Public declarations }
  end;

var
  FRecebimento: TFRecebimento;

implementation

uses URecebimento_cl, UCadastroCons, DateUtils, UOracle_cl,
  URecebimentoCons, URecebimentoParam, URecebimentoRel_cl,
  URRecebimentoAssinantes, UVendedorCons;

{$R *.dfm}

procedure TFRecebimento.FormActivate(Sender: TObject);
begin
  inherited;
  DMRecebimento.QRecebimentoJornalCad.Open;
  DMRecebimento.QRecebimentoJornalItem.Open;
end;

procedure TFRecebimento.DBPCadastroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFRecebimento.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DBGrid1.Enabled := (DSPrimario.DataSet.RecordCount > 0) and
    (DSPrimario.State = dsBrowse);
  BTPagar.Enabled := (DSPrimario.DataSet.RecordCount > 0) and
    (DSPrimario.State = dsBrowse);
  btExcluir.Enabled := (DSPrimario.DataSet.RecordCount > 0) and
    (DSPrimario.State = dsBrowse);
end;

procedure TFRecebimento.BTPagarClick(Sender: TObject);
var wRetorno: String;
begin
  inherited;
  wRetorno := InputBox('Pagamento','Digite o valor pago','0,00');
  try
    if wRetorno <> '0,00' then
      Pagar(StrToFloat(wRetorno));
  Except
  end;
end;
procedure TFRecebimento.Pagar(pValor: Double);
begin
  with DMRecebimento do
  begin
    QRecebimentoJornalItem.Edit;
    QRecebimentoJornalItemVAL_PAGO.Value := pValor;
    QRecebimentoJornalItemDT_PAGAMENTO.Value := DMOracle.DataServ;
    QRecebimentoJornalItem.Post;
  end;
end;

procedure TFRecebimento.VoltaPagamento;
begin
  with DMRecebimento do
  begin
    if MessageDlg('Deseja realmente voltar esse pagamento?', mtConfirmation, [mbOk, mbCancel],0) = mrOk then
    begin
      QRecebimentoJornalItemDT_PAGAMENTO.Clear;
      QRecebimentoJornalItemVAL_PAGO.Value := 0;
    end;
  end;
end;

procedure TFRecebimento.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBPanel2.SetFocus;
end;

procedure TFRecebimento.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRecebimentoCons = Nil then
    FRecebimentoCons := TFRecebimentoCons.Create(Application);
  if FRecebimentoCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMRecebimento.QRecebimentoJornalConsCOD_RECEBIMENTO_JORNAL.Text;
    MeLocalizaExit(Sender);
  end;
end;

procedure TFRecebimento.RecebimentodeAssinantes1Click(Sender: TObject);
begin
  inherited;
  if FRecebimentoParam = Nil then
    FRecebimentoParam := TFRecebimentoParam.Create(Application);
  FRecebimentoParam.AtivaPagina(0);
  if FRecebimentoParam.ShowModal = MrOk then
  begin
    with DMRecebimentoRel do
    begin
      QRRecebimentoJornal.Close;
      if Trim(FRecebimentoParam.FmDatas1.MeDtInicial.Text) <> '' then
        QRRecebimentoJornal.SetVariable('DT_INI', Trim(FRecebimentoParam.FmDatas1.MeDtInicial.Text))
      else
        QRRecebimentoJornal.SetVariable('DT_INI', null);
      if Trim(FRecebimentoParam.FmDatas1.MeDtFinal.Text) <> '' then
        QRRecebimentoJornal.SetVariable('DT_FIM', Trim(FRecebimentoParam.FmDatas1.MeDtFinal.Text))
      else
        QRRecebimentoJornal.SetVariable('DT_FIM', null);

      QRRecebimentoJornal.SQL[QRRecebimentoJornal.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FRecebimentoParam.Cb1Ordem.ItemIndex of
        0: QRRecebimentoJornal.SQL.Add('ORDER BY COD_VENDEDOR');
        1: QRRecebimentoJornal.SQL.Add('ORDER BY DT_VENCIMENTO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end;//case

      QRRecebimentoJornal.Open;

      if FRecebimentoParam.RGPreview.ItemIndex = 0 then
          FRRecebimentoAssinantes.QRPrimario.Preview
        else
          FRRecebimentoAssinantes.QRPrimario.Print;
      QRRecebimentoJornal.Close;
    end;
  end;
end;

procedure TFRecebimento.btExcluirClick(Sender: TObject);
begin
  inherited;    
    VoltaPagamento;
end;

procedure TFRecebimento.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
   FormConsulta := @FVendedorCons;
   Classe := TFVendedorCons;
end;

end.
