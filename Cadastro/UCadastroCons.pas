unit UCadastroCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus,
  ActnList, ComCtrls, UBiblioteca;

type
  TFCadastroCons = class(TFTConsulta)
    MENomeFantasia: TMaskEdit;
    MECGC_CPF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEInscricao: TMaskEdit;
    Label4: TLabel;
    METipoCadastro: TMaskEdit;
    Label5: TLabel;
    BtConsTipoCadastro: TBitBtn;
    Label6: TLabel;
    MECodigo: TMaskEdit;
    RgCancelado: TRadioGroup;
    SobreNome: TLabel;
    MeSobreNome: TMaskEdit;
    SBCidade: TSpeedButton;
    EdCidade: TEdit;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    LblEndereco: TLabel;
    MEEndereco: TMaskEdit;
    LblVendedor: TLabel;
    MeVendedor: TMaskEdit;
    BtConsVendedor: TBitBtn;
    ACLMenuFiscal: TActionList;
    Action1: TAction;
    StatusBar1: TStatusBar;
    MECodFicha: TMaskEdit;
    LblCodFicha: TLabel;
    METelefone: TMaskEdit;
    Label8: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsTipoCadastroClick(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOkEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mVenendedorClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MENomeFantasiaChange(Sender: TObject);
    procedure MeSobreNomeChange(Sender: TObject);
    procedure EdCidadeChange(Sender: TObject);
    procedure MEEnderecoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ChamaMenuFiscal(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure METextoEnter(Sender: TObject);
    procedure METextoExit(Sender: TObject);
  private
//    FCarregando: TFCarregando2;
    procedure Proc_Consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroCons: TFCadastroCons;

implementation

uses UCadastro_cl, UTipoCadastro_cl, UTipoCadastroCons, UClassCadastro_cl,
  UCidadeCons, UCidade_cl, UParamSistema_cl, UScpcCons, UUsuario_cl,
  UVendedorCons, UVendedor_cl, UOracle_cl;

{$R *.DFM}

procedure TFCadastroCons.BtProcurarClick(Sender: TObject);
begin
  Proc_Consulta;
  DBGrid1.SetFocus;
end;

procedure TFCadastroCons.BtConsTipoCadastroClick(Sender: TObject);
begin
  inherited;
  if FTipoCadastroCons = nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  if FTipoCadastroCons.ShowModal = mrOk then
    METipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCod_Tipo_Cadastro.Text;
end;

procedure TFCadastroCons.SBCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    EdCidade.Text := DMCidade.QCidadeConsDesc_Cidade.Value;
end;

procedure TFCadastroCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
  begin
    DbGrid1.Columns.Items[13].Index := 2;
    DbGrid1.Columns.Items[6].Index := 3;
    DbGrid1.Columns.Items[15].Index := 4;
    DbGrid1.Columns.Items[14].Index := 5;
    DbGrid1.Columns.Items[12].Index := 6;
    DbGrid1.Columns.Items[14].Index := 7;

     //DEIXA INVISÍVEL OS COMPONENTES QUE NÃO SERÃO NECESSÁRIOS
    Label2.Visible := false;
    MENomeFantasia.Visible := false;
    Label3.Visible := false;
    MECGC_CPF.Visible := false;
    Label4.Visible := false;
    MEInscricao.Visible := false;
    Label5.Visible := false;
    METipoCadastro.Visible := false;
    BtConsTipoCadastro.Visible := false;
    Label7.Visible := false;
    EdCidade.Visible := false;
    SBCidade.Visible := false;
    RgCancelado.Visible := false;
    MEEndereco.Visible := false;
    LblEndereco.Visible := false;
    MeVendedor.Visible := false;
    LblVendedor.Visible := false;
    BtConsVendedor.Visible := false;

     //ARRUMA OS COMPONENTES QUE FICARAM NA TELA
    SobreNome.Left := 224;
    SobreNome.Top := 9;
    MeSobreNome.Left := 222;
    MeSobreNome.Top := 24;
  end;

  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
    DbGrid1.Columns.Items[17].Index := 4;

  if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') or (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZAPOLI')) and
    (DMUsuario.pTipoFuncionario = 'VENDEDOR') then
  begin
    MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    MeVendedor.Enabled := False;
    BtConsVendedor.Enabled := False;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINGLIS' then
  begin
//    DBGrid1.Columns.Items[9].Index := 6;
    DBGrid1.Columns.Items[2].Visible := False;
  end;
  if DMParamSistema.CodEmpresa = 'GGIRARDI' then
  begin
    DBGrid1.Columns.Items[18].Visible := True;
    DBGrid1.Columns.Items[18].Index := 3;
  end;
  {if DMParamSistema.CodEmpresa = 'ESPINDOLA' then
  begin
    DBGrid1.Columns.Items[15].Index := 12;
  end;}

  //if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
//    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFCadastroCons.BtOkEnter(Sender: TObject);
begin
  inherited;
//  Proc_Consulta;
//  ModalResult := MrOk;
end;

procedure TFCadastroCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FScpcCons = nil then
    FScpcCons := TFScpcCons.Create(application);

  FScpcCons.meCodCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
  FScpcCons.meCodCadastroExit(Sender);

  FScpcCons.ShowModal;
end;

procedure TFCadastroCons.FormActivate(Sender: TObject);
begin
  inherited;
  Tag := 0;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
  begin
    MeCodigo.Clear;
    MeTexto.Clear;
    MeSobreNome.Clear;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    RgCancelado.ItemIndex := 0;

end;

procedure TFCadastroCons.mVenendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    MeVendedor.Text := DmVendedor.QVendedorConsCod_Vendedor.Text;

end;

procedure TFCadastroCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    Proc_Consulta;
end;

procedure TFCadastroCons.Proc_Consulta;
var
  wOrdem: Integer;
  wSql, wMsg, wCodCadastros: string;
begin
  with DMCadastro do
  begin
    QCadastroCons.Close;
    QCadastroCons.Sql.Clear;
    wSql := 'SELECT COD_CADASTRO,TB_CADASTRO.COD_CLASS_CADASTRO,TB_CADASTRO.DESC_INSCRICAO_MUNICIPAL,NOME,NUM_CGC_CPF,DESC_FANTASIA, DESC_PLACA, ';
    wSql := wSql + 'NUM_INSCRICAO,COD_ESTADO,DESC_TELEFONE,DESC_FAX,DESC_CELULAR,DT_CANCELAMENTO,DESC_CIDADE,DESC_ENDERECO, DESC_ORGAO_EMISSOR,';
    wSql := wSql + 'COD_BANCO_AGENCIA,DESC_AGENCIA,DESC_CONTA_CORRENTE,DESC_BAIRRO,DESC_CEP,DT_NASCIMENTO,DT_CONSULTA_SINTEGRA,TB_CLASS_CADASTRO.IND_VENDA,TB_CLASS_CADASTRO.IND_SEPROCADO_LOJA,TB_CLASS_CADASTRO.IND_ATENCAO,';
    wSql := wSql + 'DESC_CLASSIFICACAO,DT_SEPROCADO,DESC_OBS,NOME_CONJUGE,NOME_TITULAR,NOME_CONTATO,DT_NASCIMENTO_CONTATO,COD_VENDEDOR,COD_VENDEDOR_PREPOSTO,COD_TIPO_CADASTRO,';
    wSql := wSql + 'IND_FISICA_JURIDICA,VAL_LIMITE,DT_FUNDACAO,DT_CADASTRO,COD_RAMO,DESC_E_MAIL,DESC_COMPLEMENTO, IND_REGIME_ESPECIAL, PERC_DESCONTO, IND_SINC_MAX_ROTEIRIZADOR, COD_CIDADE, DESC_COD_FICHA, COD_MENSAGEM, DT_VCTO_ALVARA_SANITARIO, ';
    if DMParamSistema.QParamSistemaIND_CLIENTE_TITULO_ATRASADO.Value = 'S' then
    begin
      wSql := wSql + 'CASE WHEN (SELECT COUNT(*) FROM TB_CONTA_RECEBER_CAB R WHERE SYSDATE > R.DT_VENCIMENTO AND R.IND_SITUACAO <> ''BAIXA TOTAL'' ';
      wSql := wSql + 'AND R.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO) > 0 THEN ''S'' ELSE ''N'' END AS IND_TITULO_ATRASADO ';
    end
    else
      wSql := wSql + '''N'' AS IND_TITULO_ATRASADO ';
    wSql := wSql + 'FROM TB_CADASTRO,TB_CLASS_CADASTRO WHERE ';
    wSql := wSql + ' TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO(+)';
    wOrdem := 5;
    if Trim(MECodigo.Text) <> '' then
    begin
      wSql := wSql + ' And TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodigo.Text);
      wOrdem := 5;
    end;
    if Trim(METipoCadastro.Text) <> '' then
    begin
      wSql := wSql + ' AND TB_CADASTRO.COD_TIPO_CADASTRO = ' + Trim(METipoCadastro.Text);
      wOrdem := 1;
    end;
    //Marcos - Agrop. Querencia não aparecer consulta dos fornecedores para vendedores e colaboradores  - Junior 11/12/2018
    if (DMParamSistema.CodEmpresa = 'QUERENCIA') and ((DMUsuario.pTipoFuncionario = 'VENDEDOR') or (DMUsuario.pTipoFuncionario = 'COLABORADOR')) then
    begin
      wSql := wSql + ' AND TB_CADASTRO.COD_TIPO_CADASTRO = 1' ;
      wOrdem := 1;
    end;
    if Trim(METexto.Text) <> '' then
    begin
      wSql := wSql + ' AND UPPER(TB_CADASTRO.NOME) Like ' + chr(39) + UPPERCASE(Trim(METexto.Text)) + '%' + chr(39);
      wOrdem := 2;
    end;
    if Trim(MENomeFantasia.Text) <> '' then
    begin
      wSql := wSql + ' AND UPPER(TB_CADASTRO.DESC_FANTASIA) Like ' + chr(39) + UPPERCASE(Trim(MENomeFantasia.Text)) + '%' + chr(39);
      wOrdem := 3;
    end;
    if Trim(MEInscricao.Text) <> '' then
    begin
      wSql := wSql + ' AND TB_CADASTRO.NUM_INSCRICAO Like ' + chr(39) + Trim(MEInscricao.Text) + '%' + chr(39);
      wOrdem := 6;
    end;
    if Trim(MEEndereco.Text) <> '' then
    begin
      wSql := wSql + ' AND TB_CADASTRO.DESC_ENDERECO LIKE ' + chr(39) + '%' + Trim(MEEndereco.Text) + '%' + chr(39);
      wOrdem := 7;
    end;
    if Trim(MECGC_CPF.Text) <> '' then
    begin
      wSql := wSql + ' AND LIMPA_CNPJ(TB_CADASTRO.NUM_CGC_CPF) Like LIMPA_CNPJ(' + chr(39) + Trim(MECGC_CPF.Text) + '%' + chr(39) + ')';
      wOrdem := 4;
    end;
    if Trim(MESobreNome.Text) <> '' then
    begin
      wSql := wSql + ' AND UPPER(TB_CADASTRO.NOME) Like ' + chr(39) + '%' + UPPERCASE(Trim(MESobreNome.Text)) + '%' + chr(39);
      wOrdem := 2;
    end;
//Solicitado pela Rosana da Center Frio para que seja possível realizar a consulta do cadastro de cliente utilizando o numero de telefone
//Cod_suporte: 4682 - Alex 08/03/2022    
    if Trim(METelefone.Text) <> '' then
    begin
      wSql := wSql + ' AND (TB_CADASTRO.DESC_TELEFONE) Like(' + chr(39) + '%' + Trim(METelefone.Text) + '%' + chr(39) + ')';
      wOrdem := 8;
    end;

    if RgCancelado.ItemIndex = 1 then
      wSql := wSql + ' And TB_CADASTRO.COD_MOTIVO IS NULL ';

    if Trim(EdCidade.Text) <> '' then
      wSql := wSql + ' And UPPER(TB_CADASTRO.DESC_CIDADE) Like ' + chr(39) + UPPERCASE(Trim(EdCidade.Text)) + '%' + chr(39);

    if Trim(MeVendedor.Text) <> '' then
      wSql := wSql + ' And TB_CADASTRO.COD_VENDEDOR = ' + Trim(MeVendedor.Text);
    if Trim(MECodFicha.Text) <> '' then  //Utilizado pela casa dos filtros. Suporte (865). Junior 09/09/2020
      wSql := wSql + ' And TB_CADASTRO.DESC_COD_FICHA = ' + QuotedStr(Trim(MECodFicha.Text));
    QCadastroCons.Sql.add(wSql);
    case wOrdem of
      1: wSql := ' ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO';
      2: wSql := ' ORDER BY TB_CADASTRO.NOME';
      3: wSql := ' ORDER BY TB_CADASTRO.DESC_FANTASIA';
      4: wSql := ' ORDER BY TB_CADASTRO.NUM_CGC_CPF';
      6: wSql := ' ORDER BY TB_CADASTRO.NUM_INSCRICAO';
      7: wSql := ' ORDER BY TB_CADASTRO.DESC_ENDERECO';
      8: wSql := ' ORDER BY TB_CADASTRO.DESC_TELEFONE';
    else
      wSql := ' ORDER BY TB_CADASTRO.NOME';
    end;

    QCadastroCons.Sql.add(wSql);
    wSql := QCadastroCons.SQL.Text;

    QCadastroCons.Open;
  end;
end;

procedure TFCadastroCons.MENomeFantasiaChange(Sender: TObject);
begin
  inherited;
  if Trim(MENomeFantasia.Text) <> '' then
    Proc_Consulta;

end;

procedure TFCadastroCons.MeSobreNomeChange(Sender: TObject);
begin
  inherited;
  if Trim(MeSobreNome.Text) <> '' then
    Proc_Consulta;

end;

procedure TFCadastroCons.EdCidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCidade.Text) <> '' then
    Proc_Consulta;

end;

procedure TFCadastroCons.MEEnderecoChange(Sender: TObject);
begin
  inherited;
  if Trim(MEEndereco.Text) <> '' then
    Proc_Consulta;

end;

procedure TFCadastroCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var permite: string;
begin
  if DMCadastro.QCadastroConsCOD_CLASS_CADASTRO.IsNull then
    permite := 'S'
  else
    permite := DMCadastro.QCadastroConsIND_VENDA.Value;

  {if ((DMParamSistema.QParamSistemaIND_CADASTRO_RUIM_VERMELHO.Value = 'S') and
      (permite = 'N')) then
    DBGrid1.Canvas.Brush.Color := clRed;}

  //Diferenciar cor em caso de ser SEPROCADO pela loja. Dessa forma a empresa identifica que deve fazer a exclusão imediatamente do SPC.
  //Solicitação: DINGLIS. Autorizado: CÉSAR. 04/02/2016 - Junior
  if ((DMParamSistema.QParamSistemaIND_CADASTRO_RUIM_VERMELHO.Value = 'S') and
      (permite = 'N') and (DMCadastro.QCadastroConsIND_SEPROCADO_LOJA.Value = 'N')) then
    DBGrid1.Canvas.Brush.Color := clRed
  else
    if ((DMParamSistema.QParamSistemaIND_CADASTRO_RUIM_VERMELHO.Value = 'S') and
      (permite = 'N') and (DMCadastro.QCadastroConsIND_SEPROCADO_LOJA.Value = 'S')) then
     DBGrid1.Canvas.Brush.Color := clGreen;
  if (DMCadastro.QCadastroConsIND_ATENCAO.Value = 'S') then
  begin
    //DBGrid1.Canvas.Brush.Color := clMaroon;
    DBGrid1.Canvas.Brush.Color := clSkyBlue;
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')and
     (DMCadastro.QCadastroConsIND_REGIME_ESPECIAL.Value = 'SIM') then
    DBGrid1.Canvas.Brush.Color := clBlue;

  //Mostrar em cinza os clientes com titulo em atraso. Vanessa 23/07/2015  A pedido do Trento
  if ((DMParamSistema.QParamSistemaIND_CLIENTE_TITULO_ATRASADO.Value = 'S') AND (permite = 'S')) then
  begin
    with DMCadastro do
    begin
      if (DMCadastro.QCadastroConsIND_TITULO_ATRASADO.Text = 'S') then
        DBGrid1.Canvas.Brush.Color := clSilver;
    end;
  end;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFCadastroCons.ChamaMenuFiscal(Sender: TObject);
begin
  //if FImpressoraFiscal = Nil then
//    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
//  FImpressoraFiscal.ShowModal;
end;


procedure TFCadastroCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with DMCadastro do
  begin
    if Key = vk_down then
      if QCadastroCons.Active and (QCadastroCons.RecordCount > 1) and
        (QCadastroCons.RecNo < QCadastroCons.RecordCount) then
        QCadastroCons.Next;
    if Key = vk_up then
      if QCadastroCons.Active and (QCadastroCons.RecordCount > 1) and
         (QCadastroCons.RecNo > 1) then
        QCadastroCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;
end;

procedure TFCadastroCons.METextoEnter(Sender: TObject);
begin
  inherited;
  Tag := 777; //Habilitar a possibilidade de mudar o ModalResult por código;
end;

procedure TFCadastroCons.METextoExit(Sender: TObject);
begin
  inherited;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

initialization
begin
  RegisterClass(TFCadastroCons);
end;

end.

