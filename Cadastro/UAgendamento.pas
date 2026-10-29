unit UAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UFmFilial;

type
  TFAgendamento = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DbDtEntrada: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    Agendamentos1: TMenuItem;
    DBPanel6: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBCAtrasado: TDBCheckBox;
    DBPanel5: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgendamento: TFAgendamento;

implementation

uses UCadastro_cl, UAgendamentoCons, UCadastroParam, URAgendamento,
  UOracle_cl, UBiblioteca, UPedido_cl, UPedidoCons, UFilialCons, UCadastroCons,
  UProdutoCons, UParamSistema_cl;

{$R *.dfm}

procedure TFAgendamento.FormActivate(Sender: TObject);
begin
  inherited;
  DMCadastro.QAgendamento.Open;
end;

procedure TFAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCadastro.QAgendamento.Close;
end;

procedure TFAgendamento.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FAgendamentoCons = nil then
    FAgendamentoCons := TFAgendamentoCons.Create(Application);
  if FAgendamentoCons.ShowModal = mrOk then
    with DMCadastro do
    begin
      QAgendamento.Close;
      QAgendamento.SetVariable('PK', QAgendamentoConsCOD_AGENDAMENTO.Value);
      QAgendamento.Open;
    end;
end;

procedure TFAgendamento.Agendamentos1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[24].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro do
    begin
      QRAgendamento.Close;
      if (trim(FCadastroParam.FmFilial24.MeFilial.Text) <> '') then
        QRAgendamento.SetVariable('COD_FILIAL', FCadastroParam.FmFilial24.MeFilial.Text)
      else
        QRAgendamento.SetVariable('COD_FILIAL', null);
      if Trim(FCadastroParam.FmCadastro24.MeCadastro.Text) <> '' then
        QRAgendamento.SetVariable('COD_CADASTRO', FCadastroParam.FmCadastro24.MeCadastro.Text)
      else
        QRAgendamento.SetVariable('COD_CADASTRO', Null);
      if Trim(FCadastroParam.FmCidade24.MeCidade.Text) <> '' then
        QRAgendamento.SetVariable('COD_CIDADE', FCadastroParam.FmCidade24.MeCidade.Text)
      else
        QRAgendamento.SetVariable('COD_CIDADE', Null);
//Adicionado filtro de bairro. Solicitado pela Casa dos Filtros - cod_suporte: 3901 - Alex 25/10/2021
      case FCadastroParam.RGListaAgendamento.ItemIndex of
        0: QRAgendamento.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE, TB_CADASTRO.DESC_ENDERECO, TB_CADASTRO.DESC_BAIRRO');
        1: QRAgendamento.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE, TB_CADASTRO.DESC_BAIRRO, TB_CADASTRO.DESC_ENDERECO');
      end;
         
      if FCadastroParam.RGAtrasado24.ItemIndex = 0 then
        QRAgendamento.SetVariable('IND_ATRASADO', 'SIM')
      else if (FCadastroParam.RGAtrasado24.ItemIndex = 1) then
        QRAgendamento.SetVariable('IND_ATRASADO', 'NAO')
      else
         QRAgendamento.SetVariable('IND_ATRASADO', null);

      if Trim(FCadastroParam.MeAgendamento24Ini.Text) <> '' then
        QRAgendamento.SetVariable('DT_AGENDAMENTO_INI', FCadastroParam.MeAgendamento24Ini.Text);
      if Trim(FCadastroParam.MeAgendamento24Fin.Text) <> '' then
        QRAgendamento.SetVariable('DT_AGENDAMENTO_FIN', FCadastroParam.MeAgendamento24Fin.Text);
      QRAgendamento.Open;

      if FRAgendamento = nil then
        FRAgendamento := TFRAgendamento.Create(Application);
      FRAgendamento.QRLPeriodo.Caption := 'Período: ' + FCadastroParam.MeAgendamento24Ini.Text + ' Até ' + FCadastroParam.MeAgendamento24Fin.Text;
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRAgendamento.QRPrimario.Preview
      else
        FRAgendamento.QRPrimario.Print;
      QRAgendamento.Close;
      QRAgendamento.SQL[QRAgendamento.SQL.Count - 1] := '';
    end;
end;

procedure TFAgendamento.SBConfirmarClick(Sender: TObject);
Var wQuant,wDiaSemana : String;
begin
{  DMCadastro.QAgendamento.UpdateRecord;
  If DSPrimario.State = DsInsert Then
  Begin
    If DMCadastro.QAgendamentoInd_Tipo.Value = 'T' Then
     Begin
       wQuant := '0'+DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_AGENDAMENTO', 'DT_ENTRADA = ' + QuotedStr(DMCadastro.QAgendamentoDt_Entrada.Text) +' And  IND_TIPO= ' +QuotedStr('T'));
       If StrToInt(wQuant) + 1 > 2 Then
          Raise Exception.Create('Atingido número máximo de entradas por dia para Transformação');
     End;
    If DMCadastro.QAgendamentoInd_Tipo.Value = 'M' Then
     Begin
       wQuant := '0'+DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_AGENDAMENTO', 'DT_ENTRADA = ' + QuotedStr(DMCadastro.QAgendamentoDt_Entrada.Text) +' And  IND_TIPO= ' +QuotedStr('M'));
       If StrToInt(wQuant) + 1 > 4 Then
          Raise Exception.Create('Atingido número máximo de entradas por dia para Montagem');
     End;
  End;
  wDiaSemana := Bib.DataPorExtenso(DMCadastro.QAgendamentoDt_Entrada.Value);
  If (wDiaSemana = 'Domingo') Or
     (wDiaSemana = 'Sábado')  Then
  Begin
    Raise Exception.Create('Agendamento somente pode ser feito em dias da semana');
  End;
  if not dmcadastro.QAgendamentodt_saida.IsNull then
  begin
    wDiaSemana := Bib.DataPorExtenso(DMCadastro.QAgendamentoDt_Saida.Value);
    If (wDiaSemana = 'Domingo') Or
       (wDiaSemana = 'Sábado')  Then
    Begin
      Raise Exception.Create('Agendamento somente pode ser feito em dias da semana');
    End;
  end;}
  inherited;

end;

procedure TFAgendamento.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPedidoCons;
  Classe := TFPedidoCons;
end;

procedure TFAgendamento.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
   inherited;
    FormConsulta := @FFilialCons;
    Classe := TFFilialCons;
end;

procedure TFAgendamento.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFAgendamento.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

end.
