unit UNFeRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, NFeRPCRetorno, Buttons, UBiblioteca,
  ComCtrls;

type
  TFNFeRetorno = class(TForm)
    Label1: TLabel;
    MECStat: TMaskEdit;
    PPrincipal: TPanel;
    BtFechar: TBitBtn;
    BtErro: TBitBtn;
    Label2: TLabel;
    treeViewResultado: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtErroClick(Sender: TObject);
  private
    FErros: Array of String;
    class function MapaErros: TVariantMap;
    class function MapaErrosCTe: TVariantMap;
    class function FormataMsg(Msg: String; Campo: String): String;
  public
    procedure Carrega(Acao: String;Ret: TNFeRPCRetorno);
  end;

var
  FNFeRetorno: TFNFeRetorno;

const
  VAR_CAMPO: String = '%CAMPO%';

  MSG_CAMPO_INVALIDO: String = 'Parece que o campo "%CAMPO%" está inválido.';
  MSG_CAMPO_INVALIDO_NOTA: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira nos documentos enviados e veja se ele foi informado corretamente.';
  MSG_CAMPO_INVALIDO_ITEM: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira nos itens dos documentos enviados e veja se ele foi informado corretamente.';
  MSG_CAMPO_INVALIDO_PROD: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira cadastro dos produtos dos documentos enviados e veja se ele foi informado corretamente.';
  MSG_CAMPO_INVALIDO_CADASTRO: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira no cadastro dos clientes dos documentos enviados e veja se ele foi informado corretamente.';
  MSG_CAMPO_INVALIDO_FILIAL: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira no cadastro da filial dos documentos enviados e veja se ele foi informado corretamente.';
  MSG_CAMPO_INVALIDO_CAD_FILIAL: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira nos respectivos cadastros e veja se o campo foi informado corretamente.';



  MSG_CAMPO_INVALIDO_PROD_CTE: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira o cadastro do produto e veja se o campo foi informado corretamente.';
  MSG_CAMPO_INVALIDO_AGENTES_SERVICO: String = 'Parece que o campo "%CAMPO%" está inválido. ' +
      'Confira no cadastro do Remetente, Destinatário, Expedidor ou Recebedor do(s) CT-e(s) enviado(s) ' +
      'e veja se o campo foi informado corretamente.';
implementation

uses StrUtils;

{$R *.dfm}

{ TFNFeRetorno }

procedure TFNFeRetorno.Carrega(Acao: String; Ret: TNFeRPCRetorno);
var
  EndOfCurrentString: Integer;
  BaseString, BreakString: String;

begin
  if Ret <> nil then
  begin
    with treeViewResultado.Items.Add(nil,Acao) do
      Selected:= true;
    treeViewResultado.Items.AddChildFirst(treeViewResultado.Selected,'Cód.  -  '+IntToStr(Ret.Status));
    treeViewResultado.Items.AddChild(treeViewResultado.Selected,'Descrição  -  '+Ret.Motivo);

    BreakString := '#13#10';
    BaseString := StringReplace(Ret.Descricao,''#$A'',' - ',[rfReplaceAll]);
    treeViewResultado.Items.AddChild( treeViewResultado.Selected,'Detalhes');

    repeat
      EndOfCurrentString := PosEx(BreakString, BaseString);
      if (EndOfCurrentString = 0) and (BaseString <> '') then
        treeViewResultado.Items.AddChild(treeViewResultado.Items.Item[3], BaseString)
      else
      if BaseString <> '' then
      begin
        treeViewResultado.Items.AddChild(treeViewResultado.Items.Item[3], Copy(BaseString, 1, EndOfCurrentString - 1));
        BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);
      end;
    until EndOfCurrentString = 0;
    treeViewResultado.FullExpand;
  end;
end;

procedure TFNFeRetorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MECStat.Text := '';
  //MMotivo.Lines.Text := '';
  
  treeViewResultado.Items.Clear;
end;

procedure TFNFeRetorno.BtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFNFeRetorno.FormActivate(Sender: TObject);
  procedure AdicionaErro(Erro: String);
  var
    i: Integer;
  begin
    i := Length(FErros);
    SetLength(FErros, i + 1);
    FErros[i] := Erro;
  end;
var
  i, j, fim: Integer;
  Linha, BuscaNFe, BuscaCTe, Campo: String;
  MeuMapa: TVariantMap;
  MeuMapaCTe: TVariantMap;
begin
  SetLength(FErros, 0);
  BuscaNFe := 'portalfiscal.inf.br/nfe:';
  BuscaCTe := 'portalfiscal.inf.br/cte:';
  //Rastreando erros.
  MeuMapa := MapaErros;
  MeuMapaCTe := MapaErrosCTe;
  for i := 0 to treeViewResultado.Items.Count - 1 do
  begin
    Linha := treeViewResultado.Items[i].Text;
    j := PosEx(BuscaNFe, Linha);
    if j > 0 then
    begin
      fim := PosEx(#39, Linha, j) - j - Length(BuscaNFe);
      Campo := Copy(Linha, j + Length(BuscaNFe), fim);
      if MeuMapa.contem(Campo) then
        AdicionaErro(MeuMapa.getValue(Campo))
      else
        AdicionaErro(FormataMsg(MSG_CAMPO_INVALIDO_NOTA, Campo));
    end;
    j := PosEx(BuscaCTe, Linha);
    if j > 0 then
    begin
      fim := PosEx(#39, Linha, j) - j - Length(BuscaCTe);
      Campo := Copy(Linha, j + Length(BuscaCTe), fim);
      if MeuMapa.contem(Campo) then
        AdicionaErro(MeuMapaCTe.getValue(Campo))
      else
        AdicionaErro(FormataMsg(MSG_CAMPO_INVALIDO_NOTA, Campo));
    end;
  end;
  BtErro.Visible := (Length(FErros) > 0);
  if BtErro.Visible then
    BtErro.Click;
end;

procedure TFNFeRetorno.BtErroClick(Sender: TObject);
  procedure AddLinha(var Str: String; Linha: String);
  begin
    Str := Str + Linha + #13 + #10;
  end;
var
  i: Integer;
  Msg: String;
begin
  Msg := '';
  if Length(FErros) > 0 then
  begin
    AddLinha(Msg, 'Erros prováveis:');
    AddLinha(Msg, '');
    for i := 0 to Length(FErros) - 1 do
      AddLinha(Msg, '- ' + FErros[i]);
    MessageDlg(Msg, mtInformation, [mbOK], 0);
  end
  else
    MessageDlg('Não há erros para serem exibidos.', mtInformation, [mbOK], 0);
end;

class function TFNFeRetorno.MapaErros: TVariantMap;
begin
  Result := TVariantMap.Create;
  Result.addValue('infAdProd', FormataMsg(MSG_CAMPO_INVALIDO_ITEM, 'informações adicionais do item'));
  Result.addValue('xProd', FormataMsg(MSG_CAMPO_INVALIDO_PROD, 'descrição do produto'));
  Result.addValue('xNome', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'nome do cliente ou do transportador ou descrição da filial'));
  Result.addValue('IE', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'inscrição estadual do cliente ou da filial'));
  Result.addValue('infCpl', FormataMsg(MSG_CAMPO_INVALIDO_NOTA, 'observações da nota ou observações de corpo de nota'));
  Result.addValue('CNPJ', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'CNPJ do cliente ou da filial'));
  Result.addValue('CPF', FormataMsg(MSG_CAMPO_INVALIDO_CADASTRO, 'CPF do cliente'));
  Result.addValue('xFant', FormataMsg(MSG_CAMPO_INVALIDO_FILIAL, 'nome fantasia da filial'));
  Result.addValue('xLgr', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'endereço do cliente ou da filial'));
  Result.addValue('xCpl', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'complemento de endereço do cliente ou da filial'));
  Result.addValue('xBairro', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'bairro do cliente ou da filial'));
  Result.addValue('cMun', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'código IBGE do município do cliente ou da filial'));
  Result.addValue('xMun', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'município do cliente ou do transportador ou da filial'));
  Result.addValue('CEP', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'CEP do cliente ou da filial'));
  Result.addValue('IM', FormataMsg(MSG_CAMPO_INVALIDO_CADASTRO, 'inscrição municipal'));
  Result.addValue('EXTIPI', FormataMsg(MSG_CAMPO_INVALIDO, 'código EX da Tabela de IPI') + ' Verifique se algum dos produtos da nota não estão marcados como serviço lá no cadastro deles no sistema de estoque.');
  Result.addValue('vUnCom', FormataMsg(MSG_CAMPO_INVALIDO_ITEM, 'valor unitário do item'));
  Result.addValue('vFrete', FormataMsg(MSG_CAMPO_INVALIDO_ITEM, 'valor do frete do item'));
  Result.addValue('xEnder', FormataMsg(MSG_CAMPO_INVALIDO_CADASTRO, 'endereço do transportador'));
//  Result.addValue('', FormataMsg(MSG_CAMPO_INVALIDO_NOTA, ''));
end;

class function TFNFeRetorno.MapaErrosCTe: TVariantMap;
begin
  Result := TVariantMap.Create;
  Result.addValue('proPred', FormataMsg(MSG_CAMPO_INVALIDO_PROD_CTE, 'descrição do produto'));
  Result.addValue('xNome', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'nome do Remetente, Destinatário, Expedidor, Recebedor ou descrição da filial'));
  Result.addValue('IE', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'inscrição estadual do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('CNPJ', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'CNPJ do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('CPF', FormataMsg(MSG_CAMPO_INVALIDO_AGENTES_SERVICO, 'CPF do do Remetente, Destinatário, Expedidor ou Recebedor'));
  Result.addValue('xFant', FormataMsg(MSG_CAMPO_INVALIDO_FILIAL, 'nome fantasia da filial'));
  Result.addValue('xLgr', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'endereço do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('xCpl', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'complemento de endereço do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('xBairro', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'bairro do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('cMun', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'código IBGE do município do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('xMun', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'município do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('CEP', FormataMsg(MSG_CAMPO_INVALIDO_CAD_FILIAL, 'CEP do Remetente, Destinatário, Expedidor, Recebedor ou da filial'));
  Result.addValue('xEnder', FormataMsg(MSG_CAMPO_INVALIDO_AGENTES_SERVICO, 'endereço do Remetente, Destinatário, Expedidor ou Recebedor'));
end;

class function TFNFeRetorno.FormataMsg(Msg, Campo: String): String;
begin
  Result := Bib.SubstituiStr(Msg, VAR_CAMPO, Campo);
end;

end.
