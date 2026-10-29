unit UExporta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, maskUtils;

type
  TFExporta = class(TFTCadSimples)
    GroupBox1: TGroupBox;
    RbCliente: TCheckBox;
    RbCondicao: TCheckBox;
    RbTitulos: TCheckBox;
    RbProdutos: TCheckBox;
    RbRepresentante: TCheckBox;
    RbGrupos: TCheckBox;
    RbNota: TCheckBox;
    GroupBox2: TGroupBox;
    MeData: TMaskEdit;
    BtExportacao: TBitBtn;
    CBCadastro: TCheckBox;
    GroupBox3: TGroupBox;
    MeDtCadastro: TMaskEdit;
    MeDataFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    LblQtCliente: TLabel;
    LblQtCondicao: TLabel;
    LblQtTitulos: TLabel;
    LblQtProdutos: TLabel;
    LblQtRepresentantes: TLabel;
    LblQtGrupos: TLabel;
    LblQtNotas: TLabel;
    RgEmpresa: TRadioGroup;
    RbPosicaoPedidos: TCheckBox;
    LblQtPosicao: TLabel;
    RbDiasUteis: TCheckBox;
    LlbQtDias: TLabel;
    RbTabela: TCheckBox;
    LblQtTabela: TLabel;
    RbSaldo: TCheckBox;
    LblQtSaldo: TLabel;
    procedure BtExportacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExporta: TFExporta;

implementation

uses UExporta_Cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

{ Função converte espacos em branco/ponto/virgula em zeros }
function StrZero(Num : Real ; Zeros,Deci: integer): string;
var V : String;
    Z : Integer;
begin

  Str(Num:Zeros:Deci, V);
  Trim(V);
  { Convert spaces to zeroes }
  while Pos(' ', V) > 0 do
  begin
    V[Pos(' ', V)] := '0'
  end;

  while ( Pos('.', V) > 0 ) or ( Pos(',', V) > 0 ) do
  begin
    z := Pos('.',V);     // Pega posição
    Delete(V,z,1);      // Deleta na posição.
    Insert('0',V,1);    // Inclui 0 na primeira posicao.
  end;
  Result := V;
end;

procedure TFExporta.BtExportacaoClick(Sender: TObject);
Var
  F : TextFile;
  S, wCep,wCnpj,wInscricao,wMotivo,wExtensao,wDiretorio : String;
  S1,S2,S3,S4,S5,S6,S7,S8 : String;
  wI, wContador,wUltimoDia,wContCliente, wInd : Integer;
  wVal_Comissao : Real;
  wDia,wMes,wAno : Word;
  wTabela : Array[1..30] Of Char;
begin
  inherited;
  wContador := 0;
  wExtensao := 'Txt';
  if DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= ' + '0') = 'ZADIMEL' then
   begin
     If RgEmpresa.ItemIndex = 0 Then
       wDiretorio:= 'c:\cemapa\zadimel'
     Else
       wDiretorio:= 'c:\zadimel\fromhost';
   End
  else
   Begin
     If RgEmpresa.ItemIndex = 0 Then
       wDiretorio:= 'c:\cemapa\faville'
     else
       wDiretorio:= 'c:\faville\fromhost';
    End;
  wContCliente := 0;  // para nao gerar o hstfinal se nao exportou nenhum cliente
  With DMExporta do
  Begin
     If RbCliente.Checked Then
     Begin
       if CBCadastro.Checked then
       begin
         DMOracle.QExecSQL.Close;
         DMOracle.QExecSQL.SQL.Clear;
         DMOracle.QExecSQL.SQL.Add('delete log_tb_cadastro');
         DMOracle.QExecSQL.ExecSQL;

         DMOracle.QExecSQL.Close;
         DMOracle.QExecSQL.SQL.Clear;
         DMOracle.QExecSQL.SQL.Add('insert into log_tb_cadastro(cod_cadastro,Dt_Log) select cod_cadastro,SysDate from tb_cadastro Where COD_VENDEDOR IS NOT NULL AND COD_VENDEDOR <> 1');
         DMOracle.QExecSQL.ExecSQL;
       end;

       QExportaCadastro.Close;
       QExportaCadastro.SetVariable('Dt_Log',MeDtCadastro.Text);
       QExportaCadastro.Open;
       s := '';
       While Not QExportaCadastro.Eof Do
       Begin
         S := S + '01';
         S := S + StrZero(QExportaCadastroCod_Cadastro.Value,6,0);
         S := S + '01';
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroNome.Value);
         S := S + QExportaCadastroInd_Fisica_Juridica.Value;
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Fantasia.Value);
         S := S + 'R';
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Endereco.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QExportaCadastroDesc_Cidade.Value);
         S := S + FormatMaskText('CC',QExportaCadastroCod_Estado.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Bairro.Value);
         S := S +FormatMaskText('CCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Estado.Value);
         wI := 1;
         wCep := '';
         while wI <= Length(QExportaCadastroDesc_Cep.Value) do
         begin
           if ( Copy(QExportaCadastroDesc_Cep.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroDesc_Cep.Value, wI, 1) <= '9' ) then
              wCep := wCep + Copy(QExportaCadastroDesc_Cep.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCC',wCep);
         S := S + '         ';
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QExportaCadastroDesc_Telefone.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QExportaCadastroDesc_Fax.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Endereco_Cobranca.Value);
         S := S + StrZero(QExportaCadastroCod_Pais.Value,3,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Endereco_Cobranca.Value);
         wI := 1;
         wCnpj := '';
         while wI <= Length(QExportaCadastroNum_Cgc_Cpf.Value) do
         begin
           if ( Copy(QExportaCadastroNum_Cgc_Cpf.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroNum_Cgc_Cpf.Value, wI, 1) <= '9' ) then
              wCnpj := wCnpj + Copy(QExportaCadastroNum_Cgc_Cpf.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCCCCCCCC',wCnpj);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QExportaCadastroNome_Contato.Value);
         wI := 1;
         wInscricao := '';
         while wI <= Length(QExportaCadastroNum_Inscricao.Value) do
         begin
           if ( Copy(QExportaCadastroNum_Inscricao.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroNum_Inscricao.Value, wI, 1) <= '9' ) then
              wInscricao := wInscricao + Copy(QExportaCadastroNum_Inscricao.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCC',wInscricao);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Inscricao_Municipal.Value);
         S := S + StrZero(QExportaCadastroCod_Vendedor.Value,6,0);
         S := S + '00000   00';
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',wInscricao);
         S := S + FormatDateTime('ddmmyy',QExportaCadastroDt_Nascimento.Value);
         S := S + StrZero(QExportaCadastroCod_Motivo.Value,6,0);
         If QExportaCadastroCod_Motivo.Text <> '' Then
            wMotivo := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = ' + QExportaCadastroCod_Motivo.Text)
         Else
            wMotivo := ' ';
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wMotivo);
         S := S + StrZero((QExportaCadastroVal_Limite.Value * 100),14,0);
         S := S + '31120900000000000000'+Chr(13)+Chr(10);
         QExportaCadastro.Next;
         inc(wContador);
         if wContador = 5000 Then
          Begin
            S1 := S;
            S := '';
          end;
         If wContador = 10000 Then
          Begin
            S2 := S;
            S := '';
          end;
         If wContador = 15000 Then
          Begin
            S3 := S;
            S := '';
          end;
         If wContador = 20000 Then
          Begin
            S4 := S;
            S := '';
          end;
         If wContador = 25000 Then
          Begin
            S5 := S;
            S := '';
          end;
         If wContador = 30000 Then
          Begin
            S6 := S;
            S := '';
          end;
         If wContador = 35000 Then
          Begin
            S7 := S;
            S := '';
          end;
       End;
       S8 := S;
       S := S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8;
       LblQtCliente.Caption := IntToStr(wContador);
       wContCliente := wContador;
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\CLIE001.'+wExtensao)
       Else
          AssignFile( F, wDiretorio+'\HSTCLIEN.'+wExtensao);
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);

{ retirado pelo césar porque foi incluido uma data de referencia para exportar os cadastros no log_tb_cadastro
       DMOracle.QExecSQL.Close;
       DMOracle.QExecSQL.SQL.Clear;
       DMOracle.QExecSQL.SQL.Add('delete log_tb_cadastro');
       DMOracle.QExecSQL.ExecSQL;
}
    End;
// ATE AQUI EXPORTOU O CADASTRO DE CLIENTES
// AQUI COMEÇA EXPORTAÇÃO CONDICAO DE PAGAMENTO
    If RbCondicao.Checked Then
     Begin
       QCondicaoPagto.Close;
       QCondicaoPagto.Open;
//       QCondicaoPagtoDias.Close;
//       QCondicaoPagtoDias.Open;
       s := '';
       wContador := 0;
       While Not QCondicaoPagto.Eof Do
       Begin
         S := S + '01';
         S := S + StrZero(QCondicaoPagtoCod_Prazo_Vencimento.Value,3,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCC',QCondicaoPagtoDesc_Prazo_Vencimento.Value);
         S := S + StrZero(QCondicaoPagtoNum_Prazo_Maximo.Value,3,0);
         S := S + QCondicaoPagtoInd_Tipo_Pagto.Value + Chr(13)+Chr(10);
         QCondicaoPagto.Next;
         Inc(wContador);
       End;
       LblQtCondicao.Caption := IntToStr(wContador);
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\CPAG001.'+wExtensao )
       Else
          AssignFile( F, wDiretorio+'\HSTCPGTO.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU AS CONDICOES DE PAGAMENTO
    If RbTitulos.Checked Then
     Begin
       QContasReceber.Close;
       QContasReceber.SetVariable('Dt_Movimento',MeDtCadastro.Text);
       QContasReceber.Open;
       s := '';
       wContador := 0;
       While Not QContasReceber.Eof Do
       Begin
         S := S + '01';
         S := S + FormatMaskText('CCC',QContasReceberDesc_Tipo_Documento.Value);
         S := S + StrZero(QContasReceberNum_Titulo.Value,6,0);
         S := S + FormatMaskText('CC',QContasReceberNum_Parcela.Text);
         S := S + StrZero(QContasReceberCod_Cadastro.Value,6,0);
         S := S + '01';
         S := S + FormatDateTime('ddmmyy',QContasReceberDt_Emissao.Value);
         S := S + FormatDateTime('ddmmyy',QContasReceberDt_Vencimento.Value);
         S := S + FormatDateTime('ddmmyy',QContasReceberDt_Vencimento.Value);
         S := S + StrZero((QContasReceberVal_Titulo.Value * 100),17,0)+Chr(13)+Chr(10);
         QContasReceber.Next;
         Inc(wContador);
       End;
       LblQtTitulos.Caption := IntToStr(wContador);
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\PFIN001.'+wExtensao )
       Else
          AssignFile( F, wDiretorio+'\HSTDUPLI.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU AS CONTAS A RECEBER
    If RbRepresentante.Checked Then
     Begin
       QVendedor.Close;
       QVendedor.Open;
       s := '';
       wContador := 0;
       While Not QVendedor.Eof Do
       Begin
         S := S + '01';
         S := S + StrZero(QVendedorCod_Vendedor.Value,6,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QVendedorNome.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCC',QVendedorDesc_Cpf.Value);;
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QVendedorDesc_Endereco.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QVendedorDesc_Cidade.Value);
         S := S + FormatMaskText('CC',QVendedorCod_Estado.Value);
         If RgEmpresa.ItemIndex = 1 Then
          Begin
            S := S + StrZero(QVendedorPerc_Nota_Fiscal.Value,2,0);
            S := S + StrZero(QVendedorPerc_Acrescimo_Maximo.Value,2,0);
            S := S + StrZero(QVendedorPerc_Desconto_Liberado.Value,2,0);
            S := S + StrZero(QVendedorPerc_Desconto_Restricao.Value,2,0);
          End;
         S := S + QVendedorInd_Bonificacao.Value + QVendedorInd_Brinde.Value + QVendedorInd_Amostra.Value + QVendedorInd_Sem_Nota.Value + QVendedorInd_Troca.Value;
         // limpa vetor com tabelas liberadas para vendedor
         For wInd := 1 to 30 do
            wTabela[wind] := 'N';
         QTabelaVendedor.Close;
         QTabelaVendedor.SetVariable('Cod_Vendedor',QVendedorCod_Vendedor.Value);
         QTabelaVendedor.Open;
         While not QTabelaVendedor.eof Do
         Begin
           wTabela[QTabelaVendedorCod_Tabela_Pocket.Value] := 'S';
           QTabelaVendedor.Next;
         End;
         For wInd := 1 to 30 do
            S := S + FormatMaskText('C',wTabela[wind]);
         S := S + Chr(13)+Chr(10);
         QVendedor.Next;
         Inc(wContador);
       End;
       LblQtRepresentantes.Caption := IntToStr(wContador);
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\VEND001.'+wExtensao )
       Else
          AssignFile( F, wDiretorio+'\HSTREPRE.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS REPRESENTANTES (VENDEDORES)
    If RbProdutos.Checked Then
     Begin
       QProduto.Close;
       QProduto.Open;
       S := '';
       wContador := 0;
       While Not QProduto.Eof Do
       Begin
         S := S + '01';
         S := S + StrZero(QProdutoCod_Tabela_Pocket.Value,2,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QProdutoCod_Produto.Text);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QProdutoDesc_Produto.Value);
         If QPRodutoInd_Situacao.Value = 'ATIVO' Then
            S := S + 'PA'
         Else
            S := S + 'NA';
         S := S + FormatMaskText('CC',QProdutoDesc_Unidade.Value);
         S := S + '01';
         S := S + StrZero(QProdutoCod_Classe.Value,4,0);
         S := S + StrZero((QProdutoVal_Preco_AVista.Value * 100),12,0);
         S := S + StrZero((QProdutoVal_Preco_APrazo.Value * 100),12,0);
         S := S + StrZero((QProdutoNum_Embalagem.Value*10000),11,0);
         S := S + '00000';
         S := S + StrZero((QProdutoNum_Volumes.Value*10000),11,0);
         If QProdutoNum_Fabricante.Value <> '' Then
            S := S + StrZero(StrToFloat(QProdutoNum_Fabricante.Value),13,0)
         Else
            S := S + '0000000000000';
         S := S + StrZero((QProdutoPerc_Comissao.Value * 100),5,0)+Chr(13)+Chr(10);
         QProduto.Next;
         Inc(wContador);
       End;
       LblQtProdutos.Caption := IntToStr(wContador);
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\PROD001.'+wExtensao )
       Else
          AssignFile( F, wDiretorio+'\HSTPRODU.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// AQUI COMEÇA EXPORTAR O CADASTRO DE GRUPO DE PRODUTOS
    If RbGrupos.Checked Then
     Begin
       QGrupo.Close;
       QGrupo.Open;
       S := '';
       wContador := 0;
       While Not QGrupo.Eof Do
       Begin
         S := S + '01';
         S := S + FormatMaskText('CCCC',IntToStr(QGrupoCod_Classe.Value));
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QGrupoDesc_Classe.Value)+Chr(13)+Chr(10);
         QGrupo.Next;
         Inc(wContador);
       End;
       LblQtGrupos.Caption := IntToStr(wContador);
       If RgEmpresa.ItemIndex = 0 Then
          AssignFile( F, wDiretorio+'\GRUP001.'+wExtensao )
       else
          AssignFile( F, wDiretorio+'\HSTGRUPO.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// AQUI COMEÇA EXPORTAR AS NOTAS FISCAIS FATURADAS
    If RgEmpresa.ItemIndex = 0 Then
     Begin
      If RbNota.Checked Then
       Begin
         QNotas.Close;
         QNotas.SetVariable('Dt_Referencia',strtodate(MeData.Text));
         QNotas.SetVariable('Dt_Referencia_Fim',strtodate(MeDataFim.Text));
         QNotas.Open;
         S := '';
         wContador := 0;
         While Not QNotas.Eof Do
         Begin
           S := S + '01';
           S := S + FormatMaskText('CCC',QNotasCod_Serie.Value);
           S := S + StrZero(QNotasNum_Nota.Value,6,0);
           S := S + StrZero(QNotasNum_Pedido.Value,6,0);
           S := S + FormatDateTime('ddmmyy',QNotasDt_Emissao.Value);
           S := S + StrZero((QNotasVl_Nota_Fiscal.Value * 100),17,0);
           S := S + '000000000000000' + Chr(13)+Chr(10);
           QNotas.Next;
           Inc(wContador);
         End;
         LblQtNotas.Caption := IntToStr(wContador);
         AssignFile( F, wDiretorio+'\nfpe001.'+wExtensao );
         Rewrite(F);
         Writeln(F, S);
         CloseFile(F);
       End;
     End
    Else
     Begin
      If RbNota.Checked Then
       Begin
         QNotasFutura.Close;
         QNotasFutura.SetVariable('Dt_Referencia',strtodate(MeData.Text));
         QNotasFutura.SetVariable('Dt_Referencia_Fim',strtodate(MeDataFim.Text));
         QNotasFutura.Open;
         S := '';
         wContador := 0;
         While Not QNotasFutura.Eof Do
         Begin
           S := S + QNotasFuturaInd_Tipo_Pagamento.Text;
           S := S + FormatMaskText('C',QNotasFuturaCod_Filial.Text);
           S := S + FormatDateTime('ddmmyy',QNotasFuturaDt_Emissao.Value);
           S := S + StrZero(QNotasFuturaCod_Vendedor.Value,6,0);
           S := S + StrZero(QNotasFuturaCod_Cadastro.Value,6,0);
           S := S + StrZero(QNotasFuturaNum_Nota.Value,6,0);
           S := S + StrZero(QNotasFuturaCod_Produto.Value,7,0);
           S := S + StrZero(QNotasFuturaQt_Quantidade.Value,6,0);
           S := S + StrZero((QNotasFuturaVal_Unitario.Value * 100),7,0);
           S := S + StrZero((QNotasFuturaPerc_Comissao.Value * 100),5,0);
           wVal_Comissao := 0;
           If QNotasFuturaPerc_Comissao.Value > 0 Then
              wVal_Comissao := QNotasFuturaQt_Quantidade.Value * QNotasFuturaVal_Unitario.Value * QNotasFuturaPerc_Comissao.Value / 100;
           S := S + StrZero((wVal_Comissao * 100),7,0);
           S := S + StrZero(QNotasFuturaCod_Prazo_Vencimento.Value,3,0) + Chr(13)+Chr(10);
           QNotasFutura.Next;
           Inc(wContador);
         End;
         LblQtNotas.Caption := IntToStr(wContador);
         AssignFile( F, wDiretorio+'\HSTVENDA.'+wExtensao );
         Rewrite(F);
         Writeln(F, S);
         CloseFile(F);
       End;
     End;
// ATE AQUI EXPORTOU O AS NOTAS FISCAIS GERADAS
// AQUI COMEÇA EXPORTAÇÃO POSICAO DOS PEDIDOS
    If RbPosicaoPedidos.Checked Then
     Begin
       QPosicaoPedidos.Close;
       QPosicaoPedidos.SetVariable('Dt_Inicio',strtodate(MeData.Text));
       QPosicaoPedidos.SetVariable('Dt_Final',strtodate(MeDataFim.Text));
       QPosicaoPedidos.Open;
       s := '';
       wContador := 0;
       While Not QPosicaoPedidos.Eof Do
       Begin
         S := S + StrZero(QPosicaoPedidosNum_Nota.Value,6,0);
         S := S + FormatDateTime('ddmmyy',QPosicaoPedidosDt_Emissao.Value);
         S := S + StrZero(QPosicaoPedidosCod_Vendedor.Value,6,0);
         S := S + StrZero(QPosicaoPedidosCod_Cadastro.Value,6,0);
         S := S + StrZero(QPosicaoPedidosNum_Palm.Value,6,0);
         S := S + StrZero(QPosicaoPedidosCod_Produto.Value,6,0);
         S := S + StrZero((QPosicaoPedidosQt_Atendido.Value * 1000),8,0);
         S := S + StrZero((QPosicaoPedidosVal_Unitario.Value * 1000),8,0);
         If Copy(QPosicaoPedidosInd_Liberado.Value,1,1) = 'F' Then
           S := S + '02'
           Else If Copy(QPosicaoPedidosInd_Liberado.Value,1,1) = 'C' Then
             S := S + '01'
           Else If QPosicaoPedidosQt_Atendido.Value = QPosicaoPedidosQt_Pedido.Value Then
             S := S + '00'
           Else
             S := S + '03';
         S := S + Chr(13)+Chr(10);
         QPosicaoPedidos.Next;
         Inc(wContador);
       End;
       LblQtPosicao.Caption := IntToStr(wContador);
       AssignFile( F, wDiretorio+'\HSTCONFI.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS POSICAO DOS PEDIDOS

// AQUI COMEÇA EXPORTAÇÃO POSICAO DOS PEDIDOS
    If RbDiasUteis.Checked Then
     Begin
       DecodeDate(Date,wAno,wMes,wDia);
       wUltimoDia := DMOracle.DiasNoMes(Date);
       QExportaDias.Close;
       QExportaDias.SetVariable('Dt_Inicio',StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno)));
       QExportaDias.SetVariable('Dt_Final',StrToDate(IntToStr(wUltimoDia)+'/'+IntToStr(wMes)+'/'+IntToStr(wAno)));
       QExportaDias.Open;
       s := '';
       wContador := 0;
       While Not QExportaDias.Eof Do
       Begin
         S := S + FormatDateTime('ddmmyy',Date);
         S := S + FormatDateTime('DD',QExportaDiasDias_Uteis.Value);
         S := S + ':'+Chr(13)+Chr(10);
         QExportaDias.Next;
         Inc(wContador);
       End;
       LlbQtDias.Caption := IntToStr(wContador);
       AssignFile( F, wDiretorio+'\HSTDIAST.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS DIAS UTEIS

    If RbTabela.Checked Then
     Begin
       QTabelaPreco.Close;
       QTabelaPreco.Open;
       s := '';
       wContador := 0;
       While Not QTabelaPreco.Eof Do
       Begin
         S := S + '2';
         S := S + FormatDateTime('ddmmyy',Date);
         S := S + '00000000';
         S := S + StrZero(QTabelaPrecoCod_Tabela_Pocket.Value,2,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCC',QTabelaPrecoDesc_Tabela.Value);
         S := S + StrZero(QTabelaPrecoNum_Prazo_Maximo.Value,3,0);
         S := S + StrZero((QTabelaPrecoPerc_Comissao.Value*100),5,0);
         S := S + StrZero(QTabelaPrecoQt_Minimo_Caixas.Value,6,0);
         S := S + Chr(13)+Chr(10);
         QTabelaPreco.Next;
         Inc(wContador);
       End;
       LblQtTabela.Caption := IntToStr(wContador);
       AssignFile( F, wDiretorio+'\HSTTABEL.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS TABELA DE PRECOS
    If RbSaldo.Checked Then
     Begin
       QVerbaVendedor.Close;
       DecodeDate(Date,wAno,wMes,wDia);
       QVerbaVendedor.SetVariable('Num_Mes',wMes);
       QVerbaVendedor.SetVariable('Num_Ano',wAno);
       QVerbaVendedor.Open;
       s := '';
       wContador := 0;
       While Not QVerbaVendedor.Eof Do
       Begin
         S := S + '2';
         S := S + FormatDateTime('ddmmyy',Date);
         S := S + '0000';
         S := S + StrZero(QVerbaVendedorCod_Vendedor.Value,6,0);
         S := S + StrZero(((QVerbaVendedorVal_Verba.Value - QVerbaVendedorVal_Utilizado.Value) * 100),7,0);
         S := S + Chr(13)+Chr(10);
         QVerbaVendedor.Next;
         Inc(wContador);
       End;
       LblQtSaldo.Caption := IntToStr(wContador);
       AssignFile( F, wDiretorio+'\HSTSLBON.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS SALDOS DE BONIFICACAO/BRINDES

// aqui gera um arquivo para indicar que terminou a exportacao
    If not(RbCliente.Checked) or (wContCliente > 0) Then
    Begin
      S := '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ)+'0000';
      S := S + DMParamSistema.QParamSistemaCod_Empresa.Value;
      AssignFile( F, wDiretorio+'\HSTFINAL.'+wExtensao );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
    End;
  End;
//  showmessage('Exportação encerrada');
  close;
end;

procedure TFExporta.FormActivate(Sender: TObject);
begin
  inherited;
  MeData.Text := DateToStr(Date);
  MeDataFim.Text := DateToStr(Date);
  MeDtCadastro.Text := DateToStr(Date);

  StBLongHint.SimpleText := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;

  //esse form é usado pelo PjExportaORCL e PjExportaORA como a tela principal
  //onde a execução da exportação é automatica
  if Application.MainForm = Self then
  begin
    Application.ProcessMessages;
    BtExportacaoClick(Self);
    Application.Terminate;
  end;
end;

end.
